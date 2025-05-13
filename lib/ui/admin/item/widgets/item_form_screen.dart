import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/config/item_providers.dart';
import 'package:sirnawa_mobile/data/services/api/model/item/item_request_model.dart';
import 'package:sirnawa_mobile/data/services/api/model/item/item_type.dart';
import 'package:sirnawa_mobile/domain/model/item/item_model.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';

class ItemFormScreen extends ConsumerStatefulWidget {
  final ItemModel? item;

  const ItemFormScreen({super.key, this.item});

  @override
  ConsumerState<ItemFormScreen> createState() => _ItemFormScreenState();
}

class _ItemFormScreenState extends ConsumerState<ItemFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late String _selectedItemType;

  @override
  void initState() {
    super.initState();
    final currentItem = widget.item;
    _nameController = TextEditingController(text: currentItem?.name ?? '');
    _descriptionController = TextEditingController(
      text: currentItem?.description ?? '',
    );
    _selectedItemType = currentItem?.itemType ?? ItemType.ipl;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(itemViewModelProvider);
    final notifier = ref.read(itemViewModelProvider.notifier);
    final rtId = ref.watch(
      homeViewModelProvider.select((s) => s.userRtModel?.rtId ?? ""),
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: widget.item == null ? 'Create Item' : 'Edit Item',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedItemType,
                decoration: const InputDecoration(
                  labelText: 'Item Type',
                  border: OutlineInputBorder(),
                ),
                items:
                    ItemType.allTypes.map((type) {
                      return DropdownMenuItem<String>(
                        value: type,
                        child: Text(type.toUpperCase()),
                      );
                    }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedItemType = value;
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an item type';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              if (state.isLoading)
                const Center(child: CircularProgressIndicator())
              else
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final itemRequest = ItemRequestModel(
                        id: widget.item?.id,
                        name: _nameController.text,
                        description: _descriptionController.text,
                        rtId: rtId,
                        itemType: _selectedItemType,
                      );

                      bool success;
                      if (widget.item == null) {
                        success = await notifier.createItem(
                          resident: itemRequest,
                        );
                      } else {
                        success = await notifier.updateItem(
                          id: widget.item!.id,
                          resident: itemRequest,
                        );
                      }

                      if (success && mounted) {
                        //ScaffoldMessenger.of(
                        //  context,
                        //).showSnackBar(SnackBar(content: Text("OK")));
                        Navigator.pop(context);
                        ref.read(itemListProvider.notifier).refresh();
                      }
                    }
                  },
                  child: Text(widget.item == null ? 'Create' : 'Update'),
                ),
              if (state.error != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    state.error!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
