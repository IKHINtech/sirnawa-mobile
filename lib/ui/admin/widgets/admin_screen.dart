import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Admin"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: <Widget>[
                _itemAdmin(
                  onClick: () {
                    context.push(Routes.adminRw);
                  },
                  icon: Icons.map,
                  title: "Data RW",
                ),
                _itemAdmin(
                  onClick: () {
                    context.push(Routes.adminRt);
                  },
                  icon: Icons.group,
                  title: "Data RT",
                ),
                _itemAdmin(
                  onClick: () {
                    context.push(Routes.adminResident);
                  },
                  icon: Icons.person,
                  title: "Data Warga",
                ),
                _itemAdmin(
                  onClick: () {
                    context.push(Routes.adminResident);
                  },
                  icon: Icons.home,
                  title: "Data Rumah",
                ),
                _itemAdmin(
                  onClick: () {
                    context.push(Routes.adminBlock);
                  },
                  icon: Icons.apartment,
                  title: "Data Blok",
                ),
                _itemAdmin(
                  onClick: () {
                    context.push(Routes.adminResident);
                  },
                  icon: Icons.notifications,
                  title: "Pengumuman",
                ),
                _itemAdmin(
                  onClick: () {
                    context.push(Routes.adminResident);
                  },
                  icon: Icons.calendar_month,
                  title: "Jadwal Ronda",
                ),
                _itemAdmin(
                  onClick: () {
                    context.push(Routes.adminResident);
                  },
                  icon: Icons.groups_2_outlined,
                  title: "Group Ronda",
                ),

                _itemAdmin(
                  onClick: () {
                    context.push(Routes.adminResident);
                  },
                  icon: Icons.receipt_long_sharp,
                  title: "Data IPL",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _itemAdmin({
    required VoidCallback onClick,
    required String title,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: onClick,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(radius: 28, child: Icon(icon, size: 40)),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
