import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/services/api/model/house/house_request_model.dart';
import 'package:sirnawa_mobile/domain/model/block/block_model.dart';
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
  List<BlockModel> _blocks = [];

  bool get isEdit => widget.house != null;

  @override
  void initState() {
    super.initState();
    _numberController = TextEditingController(text: widget.house?.number ?? '');
    _status = widget.house?.status ?? 'occupied';
    _blockId = widget.house?.blockId ?? '';
    _loadBlocks();
  }

  Future<void> _loadBlocks() async {
    final rtid =
        ref.read(homeViewModelProvider).residentHouse?.house.rt?.id ?? "";
    await ref
        .read(blockViewModelProvider.notifier)
        .fetchListBlock(rtId: rtid, reset: true);
    final block = ref.watch(blockViewModelProvider);
    if (mounted) {
      setState(() {
        _blocks = block.list;
        // If editing and blockId exists, ensure it's selected
        if (isEdit && _blockId.isEmpty && _blocks.isNotEmpty) {
          _blockId = _blocks.first.id;
        }
      });
    }
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(houseViewModelProvider.notifier);
    final mainState = ref.read(homeViewModelProvider);

    return Scaffold(
      appBar: CustomAppBar(title: isEdit ? 'Edit Rumah' : 'Tambah Rumah'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
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
                  DropdownMenuItem(value: 'occupied', child: Text('Dihuni')),
                  DropdownMenuItem(value: 'empty', child: Text('Kosong')),
                  DropdownMenuItem(
                    value: 'under_construction',
                    child: Text('Dalam Pembangunan'),
                  ),
                ],
                onChanged:
                    (value) => setState(() {
                      _status = value!;
                    }),
                decoration: const InputDecoration(labelText: 'Status Rumah'),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value:
                    _blockId.isEmpty && _blocks.isNotEmpty
                        ? _blocks.first.id
                        : _blockId,
                items:
                    _blocks.map((block) {
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
                    rtId: mainState.residentHouse!.house.rtId,
                    blockId: _blockId,
                  );

                  if (isEdit) {
                    await viewModel.updateHouse(house.id!, house);
                  } else {
                    await viewModel.createHouse(house);
                  }

                  if (mounted) {
                    Navigator.pop(context);
                  }
                },
                child: Text(isEdit ? 'Simpan Perubahan' : 'Tambah Rumah'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
