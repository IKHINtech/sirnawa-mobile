import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/data/services/api/model/ipl_rate_detail/ipl_rate_detail_request_model.dart';

class IplRateItemFormDialog extends ConsumerStatefulWidget {
  final String rateId;
  final IplRateDetailRequestModel? item;

  const IplRateItemFormDialog({super.key, required this.rateId, this.item});

  @override
  ConsumerState<IplRateItemFormDialog> createState() =>
      _IplRateItemFormDialogState();
}

class _IplRateItemFormDialogState extends ConsumerState<IplRateItemFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _amountController;
  late TextEditingController _itemIdController;
  String? _selectedItemId;

  @override
  void initState() {
    super.initState();
    final currentItem = widget.item;
    _amountController = TextEditingController(
      text: currentItem?.amount.toString() ?? '',
    );
    _itemIdController = TextEditingController(text: currentItem?.itemId ?? '');
    _selectedItemId = currentItem?.itemId;
  }

  @override
  void dispose() {
    _amountController.dispose();
    _itemIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with your actual items provider
    final itemsAsync = ref.watch(itemNotInGroupNotifier);

    return AlertDialog(
      title: Text(widget.item == null ? 'Add Item' : 'Edit Item'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              itemsAsync.when(
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text('Error: $error'),
                data: (items) {
                  return DropdownButtonFormField<String>(
                    value: _selectedItemId,
                    decoration: const InputDecoration(
                      labelText: 'Item',
                      border: OutlineInputBorder(),
                    ),
                    items:
                        items.map((item) {
                          return DropdownMenuItem<String>(
                            value: item.id,
                            child: Text('${item.name} (${item.itemType})'),
                          );
                        }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedItemId = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select an item';
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final item = IplRateDetailRequestModel(
                id: widget.item?.id,
                amount: int.parse(_amountController.text),
                iplRateId: widget.rateId,
                itemId: _selectedItemId!,
              );
              Navigator.pop(context, item);
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
