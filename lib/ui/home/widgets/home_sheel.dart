import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sirnawa_mobile/routing/routes.dart';

class HomeShell extends StatelessWidget {
  final Widget child;
  const HomeShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: child, // content diganti-ganti di sini
      bottomNavigationBar: NavigationBar(
        selectedIndex: _getSelectedIndex(context),
        onDestinationSelected: (int index) {
          switch (index) {
            case 0:
              context.go(Routes.home);
              break;
            case 1:
              context.go(Routes.community);
              break;
            case 2:
              context.go(Routes.warung);
              break;
            case 3:
              context.go(Routes.profile);
              break;
          }
        },
        destinations: const [
          NavigationDestination(icon: Icon(LucideIcons.home), label: 'Home'),
          NavigationDestination(
            icon: Icon(LucideIcons.users),
            label: 'Community',
          ),
          NavigationDestination(icon: Icon(LucideIcons.store), label: 'Warung'),
          NavigationDestination(icon: Icon(LucideIcons.user), label: 'Profile'),
        ],
      ),
    );
  }

  int _getSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(Routes.community)) return 1;
    if (location.startsWith(Routes.warung)) return 2;
    if (location.startsWith(Routes.profile)) return 3;
    return 0;
  }
}
