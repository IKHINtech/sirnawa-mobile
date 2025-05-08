import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/services/api/model/announcement/announcement_request_model.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';

class AnnouncementFormScreen extends ConsumerStatefulWidget {
  const AnnouncementFormScreen({super.key});

  @override
  ConsumerState<AnnouncementFormScreen> createState() =>
      _AnnouncementFormScreenState();
}

class _AnnouncementFormScreenState
    extends ConsumerState<AnnouncementFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  List<File> _attachments = [];

  bool _isSubmitting = false;

  Future<void> _pickAttachments() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );

    if (result != null) {
      setState(() {
        _attachments = result.paths.map((p) => File(p!)).toList();
      });
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    try {
      final repository = ref.read(announcementViewModelProvider.notifier);
      final rtId = ref.read(
        homeViewModelProvider.select(
          (s) => s.residentHouse?.house?.rt?.id ?? "",
        ),
      );

      final userID = ref.read(
        homeViewModelProvider.select((s) => s.user?.id ?? ""),
      );
      final payload = AnnouncementRequestModel(
        rtId: rtId,
        title: _titleController.text.trim(),
        content: _contentController.text.trim(),
        createdBy: userID,
        attachments: [],
      );

      final result = await repository.createAnnouncement(payload, _attachments);

      if (result) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Pengumuman berhasil dibuat")),
        );
        Navigator.pop(context);
        // Optionally, refresh announcement list
        ref.read(announcementPaginationProvider.notifier).refresh();
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Gagal membuat pengumuman")));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Terjadi kesalahan: $e")));
    } finally {
      setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Buat Pengumuman'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Judul'),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Judul tidak boleh kosong'
                            : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _contentController,
                maxLines: 5,
                decoration: const InputDecoration(labelText: 'Isi Pengumuman'),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Konten tidak boleh kosong'
                            : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _pickAttachments,
                icon: const Icon(Icons.attach_file),
                label: const Text("Pilih Lampiran"),
              ),
              if (_attachments.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        _attachments
                            .map((file) => Text(file.path.split('/').last))
                            .toList(),
                  ),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isSubmitting ? null : _submit,
                child:
                    _isSubmitting
                        ? const CircularProgressIndicator()
                        : const Text("Kirim Pengumuman"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
