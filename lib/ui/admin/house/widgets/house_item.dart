import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sirnawa_mobile/domain/model/house/house_model.dart';
import 'package:sirnawa_mobile/routing/routes.dart';

class HouseItem extends StatelessWidget {
  final HouseModel house;

  const HouseItem(this.house, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.cottage)),
        title: Text(house.number),
        subtitle: Text(house.status),
        onTap: () {
          context.push("${Routes.houseDetail}/${house.id}");
          // Navigate to detail page if needed
        },
      ),
    );
  }
}
