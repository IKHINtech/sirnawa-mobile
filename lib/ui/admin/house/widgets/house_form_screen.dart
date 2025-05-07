import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/services/api/model/house/house_request_model.dart';
import 'package:sirnawa_mobile/domain/model/house/house_model.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';

class HouseFormScreen extends ConsumerStatefulWidget {
  final HouseModel? house;

  const HouseFormScreen({super.key, this.house});

  @override
  ConsumerState<HouseFormScreen> createState() => _HouseFormScreenState();
}

class _HouseFormScreenState extends ConsumerState<HouseFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _numberController;
  late String _status;
  late String _blockId;

  bool get isEdit => widget.house != null;

  @override
  void initState() {
    super.initState();
    _numberController = TextEditingController(text: widget.house?.number ?? '');
    _status = widget.house?.status ?? 'aktif';
    _blockId = widget.house?.blockId ?? '';
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(houseViewModelProvider.notifier);
    final state = ref.watch(houseViewModelProvider);
    final mainState = ref.read(homeViewModelProvider);
    final blocksAsync = ref.watch(blocksProvider);

    return Scaffold(
      appBar: CustomAppBar(title: isEdit ? 'Edit Rumah' : 'Tambah Rumah'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: blocksAsync.when(
          loading: () => Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('Error: $err')),
          data: (blocks) {
            return Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    controller: _numberController,
                    decoration: const InputDecoration(labelText: 'Nomor Rumah'),
                    validator:
                        (value) =>
                            value!.isEmpty ? 'Nomor rumah wajib diisi' : null,
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _status,
                    items: const [
                      DropdownMenuItem(value: 'aktif', child: Text('Dihuni')),
                      DropdownMenuItem(
                        value: 'tidak aktif',
                        child: Text('Kosong'),
                      ),
                      DropdownMenuItem(
                        value: 'kontrakan',
                        child: Text('Kontrakan'),
                      ),
                    ],
                    onChanged:
                        (value) => setState(() {
                          _status = value!;
                        }),
                    decoration: const InputDecoration(
                      labelText: 'Status Rumah',
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value:
                        _blockId.isEmpty && blocks.isNotEmpty
                            ? blocks.first.id
                            : _blockId,
                    items:
                        blocks.map((block) {
                          return DropdownMenuItem(
                            value: block.id,
                            child: Text(block.name),
                          );
                        }).toList(),
                    onChanged:
                        (value) => setState(() {
                          _blockId = value!;
                        }),
                    decoration: const InputDecoration(labelText: 'Blok'),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState?.validate() != true) return;
                      final house = HouseRequestModel(
                        id: widget.house?.id,
                        number: _numberController.text,
                        status: _status,
                        rtId: mainState.residentHouse!.house!.rtId,
                        blockId: _blockId,
                      );

                      if (isEdit) {
                        final success = await viewModel.updateHouse(
                          id: house.id!,
                          resident: house,
                          rtID: mainState.residentHouse!.house!.rtId,
                          blockId: house.blockId,
                        );
                        if (success) {
                          final _ = ref.refresh(
                            houseListProvider(
                              mainState.residentHouse!.house!.blockId,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Berhasil mengubah Data Rumah'),
                              backgroundColor: Colors.green,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                          // Optionally: navigate back atau reset form
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Gagal mengubah Data Rumah: ${state.error}',
                              ),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      } else {
                        final success = await viewModel.createHouse(
                          resident: house,
                          rtId: mainState.residentHouse!.house!.rtId,
                          blockId: house.blockId,
                        );
                        if (success) {
                          final _ = ref.refresh(
                            houseListProvider(
                              mainState.residentHouse!.house!.blockId,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Berhasil menambahkan Data Rumah'),
                              backgroundColor: Colors.green,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                          // Optionally: navigate back atau reset form
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Gagal menambahkan Data Rumah: ${state.error}',
                              ),
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      }

                      if (mounted) {
                        Navigator.pop(context);
                      }
                    },
                    child:
                        state.isLoading
                            ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(),
                            )
                            : Text(
                              isEdit ? 'Simpan Perubahan' : 'Tambah Rumah',
                            ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
