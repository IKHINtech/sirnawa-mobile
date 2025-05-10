import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/services/api/model/ronda_group_member/ronda_group_member_request_model.dart';
import 'package:sirnawa_mobile/domain/model/house/house_model.dart';
import 'package:sirnawa_mobile/domain/model/resident/resident_model.dart';
import 'package:sirnawa_mobile/domain/model/ronda_group/ronda_group_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class AddMemberDialog extends ConsumerStatefulWidget {
  final String rondaGroupId;
  const AddMemberDialog({super.key, required this.rondaGroupId});

  @override
  ConsumerState<AddMemberDialog> createState() => _AddMemberDialogState();
}

class _AddMemberDialogState extends ConsumerState<AddMemberDialog> {
  int _currentStep = 0;
  String? _selectedHouseId;
  String? _selectedResidentId;
  HouseModel? _selectedHouse;
  ResidentModel? _selectedResident;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final rondaGroup =
        ref.read(rondaGroupDetailProvider(widget.rondaGroupId)).value;
    final houseList = ref.watch(houseViewModelProvider.select((s) => s.list));
    final isLoading = ref.watch(
      houseViewModelProvider.select((s) => s.isLoading),
    );

    final penghuniAsync = ref.watch(
      listPenghuniProvider(_selectedHouseId ?? ""),
    );

    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stepper(
              currentStep: _currentStep,
              onStepContinue: _isLoading ? null : () => _onStepContinue(rondaGroup),
              onStepCancel: _onStepCancel,
              onStepTapped: (step) => setState(() => _currentStep = step),
              steps: [
                Step(
                  title: const Text('Select House'),
                  content:
                      isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              labelText: 'House',
                            ),
                            items:
                                houseList.map((house) {
                                  return DropdownMenuItem(
                                    value: house.id,
                                    child: Text(
                                      '${house.block?.name} No. ${house.number}',
                                    ),
                                  );
                                }).toList(),
                            onChanged: (value) async {
                              setState(() {
                                _selectedHouseId = value;
                                _selectedHouse = houseList.firstWhere(
                                  (house) => house.id == value,
                                );
                              });
                              if (value != null) {
                                ref.invalidate(listPenghuniProvider(value));
                              }
                            },
                          ),

                  isActive: _currentStep >= 0,
                  state:
                      _currentStep >= 0
                          ? StepState.indexed
                          : StepState.disabled,
                ),
                Step(
                  title: const Text('Select Resident'),
                  content:
                      _selectedHouseId == null
                          ? const Text('Please select a house first')
                          : penghuniAsync.when(
                            data: (penghuni) {
                              return penghuni.isEmpty
                                  ? const Text(
                                    'No residents available in this house',
                                  )
                                  : Column(
                                    children:
                                        penghuni.map((resident) {
                                          return RadioListTile<String>(
                                            title: Text(
                                              resident.resident?.name ?? "",
                                            ),
                                            subtitle: Text(
                                              'NIK: ${resident.resident?.nik}',
                                            ),
                                            value: resident.resident!.id,
                                            groupValue: _selectedResidentId,
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedResidentId = value;
                                                _selectedResident =
                                                    resident.resident;
                                              });
                                            },
                                          );
                                        }).toList(),
                                  );
                            },
                            error: (error, stackTrace) => Text('Error: $error'),
                            loading:
                                () => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                          ),
                  isActive: _currentStep >= 1,
                  state:
                      _currentStep >= 1
                          ? StepState.indexed
                          : StepState.disabled,
                ),
                Step(
                  title: const Text('Confirmation'),
                  content: _buildConfirmationStep(),
                  isActive: _currentStep >= 2,
                  state:
                      _currentStep >= 2
                          ? StepState.complete
                          : StepState.disabled,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmationStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _selectedHouse != null
              ? 'Rumah : ${_selectedHouse?.block?.name} No. ${_selectedHouse?.number}'
              : 'Rumah :  ${_selectedHouse?.number ?? 'Not selected'}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        if (_selectedResident != null) ...[
          const SizedBox(height: 8),
          Text('Warga: ${_selectedResident!.name}'),
          Text('NIK: ${_selectedResident!.nik}'),
          Text('Phone: ${_selectedResident!.phoneNumber}'),
        ],
        const SizedBox(height: 16),
        const Text('Are you sure you want to add this member?'),
        if(_isLoading) const Center(child: LinearProgressIndicator()),
      ],
    );
  }

  void _onStepContinue(rondaGroup) {
    if (_currentStep == 0 && _selectedHouseId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a house first')),
      );
      return;
    }

    if (_currentStep == 1 && _selectedResidentId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a resident first')),
      );
      return;
    }

    if (_currentStep < 2) {
      setState(() => _currentStep++);
    } else {
      _addMember(rondaGroup);
    }
  }

  void _onStepCancel() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    } else {
      Navigator.of(context).pop();
    }
  }

  Future<void> _addMember(RondaGroupModel rondaGroup) async {
    try {
      final request = RondaGroupMemberRequestModel(
        houseId: _selectedHouseId!,
        residentId: _selectedResidentId!,
        groupId: rondaGroup.id,
      );

      // Assuming you have a repository provider for ronda groups
      final repository = ref.read(rondaGroupMemberRepositoryProvider);
      setState(() {
        _isLoading = true;
      });
     final res =  await repository.createRondaGroupMember(request);
setState(() {
  _isLoading = false;
});
     String message = '';
     bool err = false;

     switch(res) {
       case Ok():
         message = 'Member added successfully';
         break;
       case Error():
         message = res.error.toString();
         err = true;
         break;
     }

      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: err ? Colors.red : Colors.green,
            content: Text(message)),
        );
        ref.invalidate(rondaGroupDetailProvider(rondaGroup.id)); // Refresh data
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to add member: $e')));
      }
    }
  }
}
