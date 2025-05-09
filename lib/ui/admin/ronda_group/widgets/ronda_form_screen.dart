import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/services/api/model/ronda_group/ronda_group_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ronda_group/ronda_group_model.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';

class RondaFormScreen extends ConsumerStatefulWidget {
  final RondaGroupModel? rondaGroup;
  const RondaFormScreen({super.key, this.rondaGroup});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RondaFormScreenState();
}

class _RondaFormScreenState extends ConsumerState<RondaFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _rtIdController;

  bool get isEdit => widget.rondaGroup != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.rondaGroup?.name ?? '',
    );
    _rtIdController = TextEditingController(
      text: widget.rondaGroup?.rtId ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _rtIdController.dispose();
    super.dispose();
  }

  bool _isSubmitting = false;

  Future<void> _submit({required RondaGroupRequestModel payload}) async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    final viewModel = ref.read(rondaGroupViewModelProvider.notifier);
    try {
      if (isEdit) {
        final success = await viewModel.updateRondaGroup(
          widget.rondaGroup!.id,
          payload,
        );
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Berhasil memperbarui Group Ronda'),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
            ),
          );
          // Optionally: navigate back atau reset form
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Gagal memperbarui Group Ronda'),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      } else {
        final success = await viewModel.createRondaGroup(payload);
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Berhasil menambahkan Group Ronda'),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Gagal menambahkan Group Ronda'),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Terjadi kesalahan: $e')));
      }
    } finally {
      if (mounted) {
        ref.read(rondaGroupPaginationProvider.notifier).refresh();
        Navigator.pop(context); // kembali ke list
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeViewModelProvider);
    return Scaffold(
      appBar: CustomAppBar(title: !isEdit ? 'Tambah Ronda' : 'Edit Ronda'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nama Grup Ronda'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama grup tidak boleh kosong';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),
              ElevatedButton(
                onPressed:
                    _isSubmitting
                        ? null
                        : () {
                          final payload = RondaGroupRequestModel(
                            id: widget.rondaGroup?.id,
                            rtId: homeState.residentHouse?.house?.rt?.id ?? "",
                            name: _nameController.text.trim(),
                          );

                          _submit(payload: payload);
                        },
                child:
                    _isSubmitting
                        ? SizedBox(
                          height: 20,
                          width: 20,
                          child: const CircularProgressIndicator(),
                        )
                        : const Text("Tambah"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
