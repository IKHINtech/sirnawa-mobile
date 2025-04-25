import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sirnawa_mobile/domain/model/resident_house/resident_house_model.dart';
import 'package:sirnawa_mobile/ui/home/view_models/home_viewmodel.dart';

class HouseDetailBottomSheet extends StatelessWidget {
  final HomeState viewmodel;
  final void Function(ResidentHouseModel) onSelect;

  const HouseDetailBottomSheet({
    super.key,
    required this.viewmodel,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final selectedHouse = viewmodel.residentHouse;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Text('Pilih Rumah', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          ...viewmodel.listHouse.map((house) {
            final isSelected = house == selectedHouse;

            return Container(
              decoration: BoxDecoration(
                color:
                    isSelected
                        ? Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.1)
                        : null,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: Icon(
                  LucideIcons.home,
                  color:
                      isSelected ? Theme.of(context).colorScheme.primary : null,
                ),
                title: Text(
                  "${house.house.block?.name ?? '-'} No. ${house.house.number}",
                  style: TextStyle(
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                    color:
                        isSelected
                            ? Theme.of(context).colorScheme.primary
                            : null,
                  ),
                ),
                trailing:
                    isSelected
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : null,
                onTap: () {
                  onSelect(house);
                  Navigator.of(context).pop(); // tutup bottom sheet
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
