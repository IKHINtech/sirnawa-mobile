import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/ipl_rate_detail_provider.dart';
import 'package:sirnawa_mobile/config/item_providers.dart';
import 'package:sirnawa_mobile/data/services/api/model/ipl_rate_detail/ipl_rate_detail_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ipl_rate_detail/ipl_rate_detail_model.dart';
import 'package:sirnawa_mobile/ui/admin/ipl_rate/view_models/ipl_rate_detail_viewmodel.dart';

class IplRateItemFormDialog extends ConsumerStatefulWidget {
  final String rateId;
  final IplRateDetailModel? item;

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
    final itemsAsync = ref.watch(itemViewModelProvider.select((e) => e.list));
    final loading = ref.watch(
      iplRateDetailViewModelProvider.select((e) => e.isLoading),
    );
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
        loading
            ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
            : TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  bool succcess = true;
                  final item = IplRateDetailRequestModel(
                    id: widget.item?.id,
                    amount: int.parse(_amountController.text),
                    iplRateId: widget.rateId,
                    itemId: _selectedItemId!,
                  );
                  if (widget.item != null) {
                    succcess = await ref
                        .read(iplRateDetailViewModelProvider.notifier)
                        .updateIplRateDetail(id: item.id!, payload: item);
                  } else {
                    succcess = await ref
                        .read(iplRateDetailViewModelProvider.notifier)
                        .createIplRateDetail(payload: item);
                  }
                  if (succcess) {
                    ref
                        .watch<IplRateDetailViewModel>(
                          iplRateDetailViewModelProvider.notifier,
                        )
                        .getIplRateDetailListIplRateDetail(
                          iplRateId: widget.rateId,
                        );
                  }
                  Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
      ],
    );
  }
}
