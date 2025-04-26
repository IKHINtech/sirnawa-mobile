import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Profile",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: Colors.white),
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
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Card(
                    child: ListTile(
                      title: Text("Name"),
                      subtitle: Text(state.user?.resident?.name ?? "-"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("Email"),
                      subtitle: Text(state.user?.email ?? "-"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("Phone"),
                      subtitle: Text(state.user?.resident?.phoneNumber ?? "-"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("NIK"),
                      subtitle: Text(state.user?.resident?.nik ?? "-"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("Gender"),
                      subtitle: Text(state.user?.resident?.gender ?? "-"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("Birth Date"),
                      subtitle: Text(
                        state.user?.resident?.birthDate.toString() ?? "-",
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text("Job"),
                      subtitle: Text(state.user?.resident?.job ?? "-"),
                    ),
                  ),
                  Card(
                    shadowColor: Colors.red,
                    surfaceTintColor: Colors.red,
                    child: ListTile(
                      leading: Icon(Icons.logout),
                      onTap: () => notifier.logout(),
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
}
