import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/config/house_provders.dart';
import 'package:sirnawa_mobile/config/ipl_bill_providers.dart';
import 'package:sirnawa_mobile/config/ipl_rate_provider.dart';
import 'package:sirnawa_mobile/data/services/api/model/ipl_bill_generate_request_model/ipl_bill_generate_request_model.dart';
import 'package:sirnawa_mobile/ui/core/ui/lottie_loading.dart';

class GenerateIplBillDialog extends ConsumerStatefulWidget {
  const GenerateIplBillDialog({super.key});

  @override
  ConsumerState<GenerateIplBillDialog> createState() =>
      _GenerateIplBillDialogState();
}

class _GenerateIplBillDialogState extends ConsumerState<GenerateIplBillDialog> {
  final _formKey = GlobalKey<FormState>();
  late DateTime _dueDate;
  late int _month;
  late int _year;
  String? _iplRateId;
  bool _isAllHouse = false;
  final List<String> _selectedHouseIds = [];
  final Map<String, String> _params = {"exclude_status": "tidak aktif"};

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _dueDate = now.add(const Duration(days: 30));
    _month = now.month;
    _year = now.year;
  }

  @override
  Widget build(BuildContext context) {
    final houseAsync = ref.watch(houseOptionsWithParams(_params));
    final iplRates = ref.watch(iplRateListProvider);
    final rtId = ref.watch(
      homeViewModelProvider.select((s) => s.userRtModel?.rtId ?? ''),
    );

    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Generate IPL Bills',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // IPL Rate Dropdown
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'IPL Rate'),
                items: iplRates.when(
                  data:
                      (rates) =>
                          rates.map((rate) {
                            return DropdownMenuItem(
                              value: rate.id,
                              child: Text('${rate.ammount}'),
                            );
                          }).toList(),
                  loading: () => [],
                  error: (_, __) => [],
                ),
                onChanged: (value) => setState(() => _iplRateId = value),
                validator:
                    (value) => value == null ? 'Please select IPL rate' : null,
              ),

              const SizedBox(height: 16),

              // Month and Year
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<int>(
                      decoration: const InputDecoration(labelText: 'Month'),
                      value: _month,
                      items:
                          List.generate(12, (index) => index + 1)
                              .map(
                                (month) => DropdownMenuItem(
                                  value: month,
                                  child: Text(
                                    DateFormat(
                                      'MMMM',
                                    ).format(DateTime(2020, month)),
                                  ),
                                ),
                              )
                              .toList(),
                      onChanged: (value) => setState(() => _month = value!),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<int>(
                      decoration: const InputDecoration(labelText: 'Year'),
                      value: _year,
                      items:
                          List.generate(
                                5,
                                (index) => DateTime.now().year + index,
                              )
                              .map(
                                (year) => DropdownMenuItem(
                                  value: year,
                                  child: Text(year.toString()),
                                ),
                              )
                              .toList(),
                      onChanged: (value) => setState(() => _year = value!),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Due Date Picker
              InkWell(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: _dueDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (date != null) {
                    setState(() => _dueDate = date);
                  }
                },
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: 'Due Date'),
                  child: Text(DateFormat('dd MMM yyyy').format(_dueDate)),
                ),
              ),

              const SizedBox(height: 16),

              // All Houses Toggle
              Row(
                children: [
                  Checkbox(
                    value: _isAllHouse,
                    onChanged:
                        (value) => setState(() {
                          _isAllHouse = value!;
                          if (_isAllHouse) _selectedHouseIds.clear();
                        }),
                  ),
                  const Text('Generate for all houses'),
                ],
              ),

              // House Selection (only if not all houses)
              if (!_isAllHouse) ...[
                const SizedBox(height: 8),
                const Text('Select Houses:'),
                const SizedBox(height: 8),
                houseAsync.when(
                  loading: () => const MyRtLoading(),
                  error: (error, stack) => Text('Error: $error'),
                  data: (houses) {
                    return Column(
                      children:
                          houses.map((house) {
                            return CheckboxListTile(
                              title: Text(house.number),
                              value: _selectedHouseIds.contains(house.id),
                              onChanged: (selected) {
                                setState(() {
                                  if (selected == true) {
                                    _selectedHouseIds.add(house.id);
                                  } else {
                                    _selectedHouseIds.remove(house.id);
                                  }
                                });
                              },
                            );
                          }).toList(),
                    );
                  },
                ),
              ],

              const SizedBox(height: 24),

              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => _generateBills(rtId),
                    child: const Text('Generate'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _generateBills(String rtId) async {
    if (!_formKey.currentState!.validate()) return;
    if (!_isAllHouse && _selectedHouseIds.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one house')),
      );
      return;
    }

    final model = IplBillGenerateRequestModel(
      dueDate: _dueDate.day,
      houseId: _selectedHouseIds,
      iplRateId: _iplRateId!,
      isAllHouse: _isAllHouse,
      month: _month,
      year: _year,
      rtId: rtId,
    );

    final result = await ref
        .read(iplBillViewModelProvider.notifier)
        .generateIplBill(payload: model);

    if (result) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('IPL bills generated successfully')),
        );
        Navigator.pop(context);
        ref.read(iplBillListProvider.notifier).refresh();
      }
    }
  }
}
