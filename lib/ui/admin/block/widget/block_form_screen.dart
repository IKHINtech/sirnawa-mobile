import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/services/api/model/block/block_request_model.dart';
import 'package:sirnawa_mobile/domain/model/block/block_model.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';

class BlockFormScreen extends ConsumerStatefulWidget {
  final BlockModel? block;

  const BlockFormScreen({super.key, this.block});

  @override
  ConsumerState<BlockFormScreen> createState() => _BlockFormScreenState();
}

class _BlockFormScreenState extends ConsumerState<BlockFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _rtIdController;

  bool get isEdit => widget.block != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.block?.name ?? '');
    _rtIdController = TextEditingController(text: widget.block?.rtId ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _rtIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(blockViewModelProvider.notifier);
    final homeState = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: CustomAppBar(title: isEdit ? 'Edit Block' : 'Tambah Block'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nama'),
                validator:
                    (value) => value!.isEmpty ? 'Nama wajib diisi' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() != true) return;

                  final resident = BlockRequestModel(
                    id: widget.block?.id, // kalau update pakai id
                    name: _nameController.text,
                    rtId: homeState.residentHouse!.house!.rtId,
                  );

                  if (isEdit) {
                    final success = await viewModel.updateBlock(
                      id: resident.id!,
                      resident: resident,
                      rtId: homeState.residentHouse!.house!.rtId,
                    );
                    if (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Berhasil memperbarui Block'),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      // Optionally: navigate back atau reset form
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Gagal memperbarui Block'),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  } else {
                    final success = await viewModel.createBlock(
                      resident: resident,
                      rtId: homeState.residentHouse!.house!.rtId,
                    );
                    if (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Berhasil menambahkan Block'),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Gagal menambahkan Block'),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  }

                  if (mounted) {
                    Navigator.pop(context); // kembali ke list
                  }
                },
                child: Text(isEdit ? 'Simpan Perubahan' : 'Tambah Blok'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
