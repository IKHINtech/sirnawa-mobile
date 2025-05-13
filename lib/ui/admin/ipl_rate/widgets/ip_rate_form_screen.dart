import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/config/ipl_rate_provider.dart';
import 'package:sirnawa_mobile/data/services/api/model/ipl_rate/ipl_rate_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ipl_rate/ipl_rate_model.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';

class IplRateFormScreen extends ConsumerStatefulWidget {
  final IplRateModel? rate;

  const IplRateFormScreen({super.key, this.rate});

  @override
  ConsumerState<IplRateFormScreen> createState() => _IplRateFormScreenState();
}

class _IplRateFormScreenState extends ConsumerState<IplRateFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _amountController;
  late TextEditingController _startDateController;
  late String _rtId;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    final currentRate = widget.rate;
    _amountController = TextEditingController(
      text: currentRate?.ammount.toString() ?? '',
    );
    _rtId =
        currentRate?.rtId ??
        ref.read(homeViewModelProvider).userRtModel?.rtId ??
        '';
    _selectedDate =
        currentRate != null ? currentRate.startDate.toLocal() : DateTime.now();
    _startDateController = TextEditingController(
      text:
          _selectedDate != null
              ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
              : '',
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    _startDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      locale: Locale('id', 'ID'),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _startDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(iplRateViewModelProvider);
    final notifier = ref.read(iplRateViewModelProvider.notifier);

    return Scaffold(
      appBar: CustomAppBar(
        title: widget.rate == null ? 'Create IPL Rate' : 'Edit IPL Rate',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
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
              const SizedBox(height: 16),
              TextFormField(
                controller: _startDateController,
                decoration: InputDecoration(
                  labelText: 'Start Date',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                ),
                readOnly: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a start date';
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
                      final iplRateRequest = IplRateRequestModel(
                        id: widget.rate?.id,
                        ammount: int.parse(_amountController.text),
                        rtId: _rtId,
                        houseType: null,
                        blockId: null,
                        startDate:
                            DateFormat('yyyy-MM-dd')
                                .parse(_startDateController.text)
                                .toUtc()
                                .toIso8601String(),
                      );

                      bool success;
                      if (widget.rate == null) {
                        success = await notifier.createIplRate(
                          payload: iplRateRequest,
                        );
                      } else {
                        success = await notifier.updateIplRate(
                          id: widget.rate!.id,
                          payload: iplRateRequest,
                        );
                      }

                      if (success && mounted) {
                        Navigator.pop(context);
                        ref.read(iplRateListProvider.notifier).refresh();
                      }
                    }
                  },
                  child: Text(widget.rate == null ? 'Create' : 'Update'),
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
