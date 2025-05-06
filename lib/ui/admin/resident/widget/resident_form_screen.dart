import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/services/api/model/resident/resident_request_model.dart';
import 'package:sirnawa_mobile/domain/model/resident/resident_model.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';

class ResidentFormScreen extends ConsumerStatefulWidget {
  final ResidentModel? resident;

  const ResidentFormScreen({super.key, this.resident});

  @override
  ConsumerState<ResidentFormScreen> createState() => _ResidentFormScreenState();
}

class _ResidentFormScreenState extends ConsumerState<ResidentFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _nikController;
  late TextEditingController _phoneController;
  late TextEditingController _jobController;
  DateTime? _birthDate;
  String _gender = "male"; // default
  bool _isHeadOfFamily = false;

  bool get isEdit => widget.resident != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.resident?.name ?? '');
    _nikController = TextEditingController(text: widget.resident?.nik ?? '');
    _phoneController = TextEditingController(
      text: widget.resident?.phoneNumber ?? '',
    );
    _jobController = TextEditingController(text: widget.resident?.job ?? '');
    _birthDate = widget.resident?.birthDate;
    _gender = widget.resident?.gender ?? "male";
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nikController.dispose();
    _phoneController.dispose();
    _jobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(residentViewModelProvider.notifier);
    final state = ref.watch(residentViewModelProvider);
    final mainState = ref.read(homeViewModelProvider);

    return Scaffold(
      appBar: CustomAppBar(title: isEdit ? 'Edit Warga' : 'Tambah Warga'),
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
              TextFormField(
                controller: _nikController,
                decoration: const InputDecoration(labelText: 'NIK'),
                validator: (value) => value!.isEmpty ? 'NIK wajib diisi' : null,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'No HP'),
              ),
              TextFormField(
                controller: _jobController,
                decoration: const InputDecoration(labelText: 'Pekerjaan'),
              ),
              const SizedBox(height: 16),
              Text(
                'Tanggal Lahir: ${_birthDate != null ? _birthDate!.toLocal().toIso8601String().split('T').first : 'Belum dipilih'}',
              ),
              ElevatedButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: _birthDate ?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    setState(() {
                      _birthDate = date;
                    });
                  }
                },
                child: const Text('Pilih Tanggal Lahir'),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _gender,
                items: const [
                  DropdownMenuItem(value: "male", child: Text('Laki-laki')),
                  DropdownMenuItem(value: "female", child: Text('Perempuan')),
                ],
                onChanged:
                    (value) => setState(() {
                      _gender = value!;
                    }),
                decoration: const InputDecoration(labelText: 'Jenis Kelamin'),
              ),
              const SizedBox(height: 16),
              const Text('Status Kepala Keluarga:'),
              Row(
                children: [
                  Radio<bool>(
                    value: true,
                    groupValue: _isHeadOfFamily,
                    onChanged: (value) {
                      setState(() {
                        _isHeadOfFamily = value!;
                      });
                    },
                  ),
                  const Text('Ya'),
                  const SizedBox(width: 20),
                  Radio<bool>(
                    value: false,
                    groupValue: _isHeadOfFamily,
                    onChanged: (value) {
                      setState(() {
                        _isHeadOfFamily = value!;
                      });
                    },
                  ),
                  const Text('Tidak'),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() != true) return;

                  final resident = ResidentRequestModel(
                    id: widget.resident?.id, // kalau update pakai id
                    name: _nameController.text,
                    nik: _nikController.text,
                    phoneNumber: _phoneController.text,
                    job: _jobController.text,
                    birthDate: DateFormat(
                      "yyyy-MM-dd'T'HH:mm:ss.SSS'+07:00'",
                    ).format(_birthDate!),
                    gender: _gender,
                    isHeadOfFamily: false,
                    role: "warga",
                    rtId: mainState.residentHouse!.house!.rtId,
                  );

                  if (isEdit) {
                    final success = await viewModel.updateResident(
                      resident.id!,
                      resident,
                    );
                    if (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Berhasil memperbarui Data Warga'),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      // Optionally: navigate back atau reset form
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Gagal memperbarui Data Warga ${state.error}',
                          ),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  } else {
                    final success = await viewModel.createResident(resident);
                    if (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Berhasil menambahkan Data Warga'),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      // Optionally: navigate back atau reset form
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Gagal menambahkan Data Warga ${state.error}',
                          ),
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
                child: Text(isEdit ? 'Simpan Perubahan' : 'Tambah Warga'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
