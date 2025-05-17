import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sirnawa_mobile/config/fcm_providers.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/core/ui/lottie_loading.dart';

class HomeShell extends ConsumerWidget {
  final Widget child;
  const HomeShell({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fcmServiceAsync = ref.watch(fcmServiceProvider);
    final fcmState = ref.watch(fcmViewModelProvider);

    return fcmServiceAsync.when(
      loading: () => const Scaffold(body: MyRtLoading()),
      error:
          (error, stack) =>
              Scaffold(body: Center(child: Text('Error: $error'))),
      data: (_) {
        return fcmState.when(
          loading: () => const Scaffold(body: MyRtLoading()),
          error:
              (error, stack) =>
                  Scaffold(body: Center(child: Text('FCM Error: $error'))),
          data:
              (_) => Scaffold(
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
                    NavigationDestination(
                      icon: Icon(LucideIcons.home),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.diversity_3),
                      label: 'Komunitas',
                    ),
                    NavigationDestination(
                      icon: Icon(LucideIcons.store),
                      label: 'Warung',
                    ),
                    NavigationDestination(
                      icon: Icon(LucideIcons.user),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
        );
      },
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
