import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sirnawa_mobile/domain/model/house/house_model.dart';
import 'package:sirnawa_mobile/routing/routes.dart';

class HouseItem extends StatelessWidget {
  final HouseModel house;

  const HouseItem(this.house, {super.key});

  @override
  Widget build(BuildContext context) {
    String status = "Dihuni";
    switch (house.status) {
      case 'aktif':
        status = 'Dihuni';
      case 'tidak aktif':
        status = 'Kosong';
      case 'kontrakan':
        status = 'Kontrakan';
    }

    Icon icon = Icon(Icons.cottage);
    switch (house.status) {
      case 'aktif':
        icon = Icon(Icons.verified_outlined, color: Colors.green);
      case 'tidak aktif':
        icon = Icon(Icons.cancel, color: Colors.red);
      case 'kontrakan':
        icon = Icon(Icons.calendar_view_month_sharp, color: Colors.orange);
    }
    return Card(
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.cottage)),
        trailing: icon,
        title: Text('${house.block?.name} No. ${house.number}'),
        subtitle: Text(status),
        onTap: () {
          context.push("${Routes.houseDetail}/${house.id}");
          // Navigate to detail page if needed
        },
      ),
    );
  }
}
