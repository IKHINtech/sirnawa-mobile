import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/services/api/model/ronda_group/ronda_group_request_model.dart';
import 'package:sirnawa_mobile/ui/admin/ronda_group/ronda_group_viewmodel/ronda_group_viewmodel.dart';

class GroupRondaScreen extends ConsumerStatefulWidget {
  const GroupRondaScreen({super.key});

  @override
  ConsumerState<GroupRondaScreen> createState() => _GroupRondaScreenState();
}

class _GroupRondaScreenState extends ConsumerState<GroupRondaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  bool _isSubmitting = false;

  Future<void> _submit({required RondaGroupRequestModel payload}) async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    final repository = ref.read(rondaGroupRepositoryProvider);

    try {
      final newGroup = await repository.createRondaGroup(payload);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Grup ronda berhasil dibuat')),
        );
        _nameController.clear();
        ref
            .read(rondaGroupViewModelProvider.notifier)
            .fetchListRondaGroup(); // refresh
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Gagal membuat grup: $e')));
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch<RondaGroupState>(rondaGroupViewModelProvider);
    final homeState = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Kelola Grup Ronda')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nama Grup Ronda',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama grup tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed:
                        _isSubmitting
                            ? null
                            : () {
                              final payload = RondaGroupRequestModel(
                                rtId:
                                    homeState.residentHouse?.house?.rt?.id ??
                                    "",
                                name: _nameController.text.trim(),
                              );

                              _submit(payload: payload);
                            },
                    child:
                        _isSubmitting
                            ? const CircularProgressIndicator()
                            : const Text("Tambah"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child:
                  state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : state.list.isEmpty
                      ? const Center(child: Text('Belum ada grup ronda.'))
                      : ListView.separated(
                        itemCount: state.list.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (context, index) {
                          final group = state.list[index];
                          return ListTile(
                            title: Text(group.name),
                            subtitle: Text(
                              'Dibuat: ${group.createdAt.toLocal()}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
