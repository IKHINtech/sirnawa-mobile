import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/services/api/model/ronda_group/ronda_group_request_model.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';

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
    final rondaGroupPaginationState = ref.watch(rondaGroupPaginationProvider);
    return Scaffold(
      appBar: CustomAppBar(title: 'Kelola Grup Ronda'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh:
                    () =>
                        ref
                            .read(rondaGroupPaginationProvider.notifier)
                            .refresh(),
                child: rondaGroupPaginationState.when(
                  data: (rondaGroups) {
                    if (rondaGroups.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.group_off,
                              size: 48,
                              color: Colors.grey,
                            ),
                            Text(
                              "Tidak ada Group Ronda",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Silakan tambahkan Group Ronda',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          if (index < rondaGroups.length) {
                            final rondaGroup = rondaGroups[index];
                            return Card(
                              child: ListTile(
                                title: Text(rondaGroup.name),
                              ),
                            );
                          } else {
                            final notifier = ref.read(
                              rondaGroupPaginationProvider.notifier,
                            );
                            if (notifier.hasMore && !notifier.isLoading) {
                              WidgetsBinding.instance.addPostFrameCallback((
                                timeStamp,
                              ) {
                                notifier.loadMore();
                              });
                            }
                            return notifier.hasMore
                                ? const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                                : const SizedBox();
                          }
                        },
                        itemCount: rondaGroups.length + 1,
                      );
                    }
                  },
                  error: (error, stack) => Center(child: Text("Error: $error")),
                  loading:
                      () => const Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




            // Form(
            //   key: _formKey,
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: TextFormField(
            //           controller: _nameController,
            //           decoration: const InputDecoration(
            //             labelText: 'Nama Grup Ronda',
            //           ),
            //           validator: (value) {
            //             if (value == null || value.isEmpty) {
            //               return 'Nama grup tidak boleh kosong';
            //             }
            //             return null;
            //           },
            //         ),
            //       ),
            //       const SizedBox(width: 12),
            //       ElevatedButton(
            //         onPressed:
            //             _isSubmitting
            //                 ? null
            //                 : () {
            //                   final payload = RondaGroupRequestModel(
            //                     rtId:
            //                         homeState.residentHouse?.house?.rt?.id ??
            //                         "",
            //                     name: _nameController.text.trim(),
            //                   );

            //                   _submit(payload: payload);
            //                 },
            //         child:
            //             _isSubmitting
            //                 ? const CircularProgressIndicator()
            //                 : const Text("Tambah"),
            //       ),
            //     ],
            //   ),
            // ),