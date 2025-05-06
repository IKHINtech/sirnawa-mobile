import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/services/api/model/rw/rw_request_model.dart';
import 'package:sirnawa_mobile/domain/model/rw/rw_model.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';

class RwFormScreen extends ConsumerStatefulWidget {
  final RwModel? rw;

  const RwFormScreen({super.key, this.rw});

  @override
  ConsumerState<RwFormScreen> createState() => _RwFormScreenState();
}

class _RwFormScreenState extends ConsumerState<RwFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;

  bool get isEdit => widget.rw != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.rw?.name ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(rwViewModelProvider.notifier);
    final state = ref.read(rwViewModelProvider);
    final homeState = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: CustomAppBar(title: isEdit ? 'Edit RW' : 'Tambah RW'),
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

                  final resident = RwRequestModel(
                    id: widget.rw?.id, // kalau update pakai id
                    name: _nameController.text,
                    housingAreaId:
                        homeState.residentHouse!.house!.hosuingArea!.id,
                  );

                  if (isEdit) {
                    final success = await viewModel.updateRw(
                      resident.id!,
                      resident,
                    );
                    if (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Berhasil memperbarui Rw'),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      // Optionally: navigate back atau reset form
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Gagal memperbarui Rw'),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  } else {
                    final success = await viewModel.createRw(resident);
                    if (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Berhasil menambahkan Rw'),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Gagal menambahkan Rw'),
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
                child:
                    state.isLoading
                        ? CircularProgressIndicator()
                        : Text(isEdit ? 'Simpan Perubahan' : 'Tambah RW'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
