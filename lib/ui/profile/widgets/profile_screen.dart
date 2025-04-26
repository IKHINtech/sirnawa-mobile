import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/ui/home/view_models/home_viewmodel.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch<HomeState>(homeViewModelProvider);
    final notifier = ref.watch<HomeViewModel>(homeViewModelProvider.notifier);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverLayoutBuilder(
            builder: (context, constraints) {
              final scrolled = constraints.scrollOffset > 100;
              return SliverAppBar(
                pinned: true,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    "Profile",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: scrolled ? Colors.black : Colors.white,
                    ),
                  ),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        "https://images.pexels.com/photos/16747471/pexels-photo-16747471/free-photo-of-sheds-in-tropical-forest-on-sea-shore.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.8),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(LucideIcons.personStanding),
                    title: Text("Data Diri"),
                    onTap: () => notifier.logout(),
                  ),
                  Card(
                    child: Column(
                      children: [
                        _buildDetailTile(
                          Icons.person,
                          "Name",
                          state.user?.resident?.name,
                        ),
                        _divider(),
                        _buildDetailTile(
                          Icons.email,
                          "Email",
                          state.user?.email,
                        ),
                        _divider(),
                        _buildDetailTile(
                          Icons.phone,
                          "Phone",
                          state.user?.resident?.phoneNumber,
                        ),
                        _divider(),
                        _buildDetailTile(
                          Icons.badge,
                          "NIK",
                          state.user?.resident?.nik,
                        ),
                        _divider(),
                        _buildDetailTile(
                          Icons.wc,
                          "Gender",
                          state.user?.resident?.gender,
                        ),
                        _divider(),
                        _buildDetailTile(
                          Icons.cake,
                          "Birth Date",
                          state.user?.resident?.birthDate.toString(),
                        ),
                        _divider(),
                        _buildDetailTile(
                          Icons.work,
                          "Job",
                          state.user?.resident?.job,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(LucideIcons.home),
                    title: Text("List Rumah"),
                    onTap: () => notifier.logout(),
                  ),
                  ...state.listHouse.map((house) {
                    final isSelected = house == state.residentHouse;

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
                              isSelected
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                        ),
                        title: Text(
                          "${house.house.block?.name ?? '-'} No. ${house.house.number}",
                          style: TextStyle(
                            fontWeight:
                                isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                            color:
                                isSelected
                                    ? Theme.of(context).colorScheme.primary
                                    : null,
                          ),
                        ),
                        trailing:
                            isSelected
                                ? const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                )
                                : null,
                      ),
                    );
                  }),
                  Divider(),

                  ListTile(
                    leading: Icon(LucideIcons.store),
                    title: Text("Warung Saya"),
                  ),

                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.add), Text("Buka Warung")],
                    ),
                  ),
                  Divider(),
                  Card(
                    shadowColor: Colors.red,
                    surfaceTintColor: Colors.red,
                    child: ListTile(
                      leading: Icon(Icons.logout),
                      onTap: () async {
                        final shouldLogout = await showDialog<bool>(
                          context: context,
                          builder:
                              (context) => AlertDialog(
                                title: Text("Konfirmasi Logout"),
                                content: Text(
                                  "Apakah kamu yakin ingin logout?",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed:
                                        () => Navigator.pop(context, false),
                                    child: Text("Batal"),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed:
                                        () => Navigator.pop(context, true),
                                    child: Text("Logout"),
                                  ),
                                ],
                              ),
                        );

                        if (shouldLogout == true) {
                          notifier.logout();
                        }
                      },
                      title: Text("Logout"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailTile(IconData icon, String title, String? value) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(title),
      subtitle: Text(value?.isNotEmpty == true ? value! : "-"),
    );
  }

  Widget _divider() =>
      const Divider(height: 0, thickness: 1, indent: 16, endIndent: 16);
}
