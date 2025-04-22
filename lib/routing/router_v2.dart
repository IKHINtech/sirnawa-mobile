import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sirnawa_mobile/data/repositories/auth/auth_repository.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/admin/rt/widget/rt_screen.dart';
import 'package:sirnawa_mobile/ui/admin/widgets/admin_screen.dart';
import 'package:sirnawa_mobile/ui/auth/login/view_models/login_viewmodel.dart';
import 'package:sirnawa_mobile/ui/auth/login/widgets/login_screen.dart';
import 'package:sirnawa_mobile/ui/community/widgets/community_screen.dart';
import 'package:sirnawa_mobile/ui/home/view_models/home_viewmodel.dart';
import 'package:sirnawa_mobile/ui/home/widgets/home_screen.dart';
import 'package:sirnawa_mobile/ui/home/widgets/home_sheel.dart';
import 'package:sirnawa_mobile/ui/profile/widgets/profile_screen.dart';
import 'package:sirnawa_mobile/ui/warung/widgets/warung_screen.dart';

GoRouter createRouter(BuildContext context) => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  redirect: _redirect,
  refreshListenable: context.read<AuthRepository>(),
  routes: [
    GoRoute(
      path: Routes.login,
      builder: (context, state) {
        return LoginScreen(
          viewModel: LoginViewModel(authRepository: context.read()),
        );
      },
    ),
    GoRoute(path: Routes.admin, builder: (context, state) => AdminScreen()),
    GoRoute(path: Routes.adminRt, builder: (context, state) => RtScreen()),
    ShellRoute(
      builder: (context, state, child) => HomeShell(child: child),
      routes: [
        GoRoute(
          path: Routes.home,
          pageBuilder:
              (context, state) => NoTransitionPage(
                child: HomeScreen(
                  viewModel: HomeViewmodel(userRepo: context.read()),
                ),
              ),
        ),
        GoRoute(
          path: Routes.profile,
          pageBuilder:
              (context, state) => NoTransitionPage(child: ProfileScreen()),
        ),
        GoRoute(
          path: Routes.warung,
          pageBuilder:
              (context, state) => NoTransitionPage(child: WarungScreen()),
        ),
        GoRoute(
          path: Routes.community,
          pageBuilder:
              (context, state) => NoTransitionPage(child: CommunityScreen()),
        ),
      ],
    ),
  ],
);
Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  final authRepo = context.read<AuthRepository>();
  final loggedIn = await authRepo.isAuthenticated;
  final loggingIn = state.matchedLocation == Routes.login;

  // Don't redirect if we're already on the right page
  if (loggingIn && !loggedIn) return null;
  if (!loggingIn && loggedIn) return null;

  if (!loggedIn) {
    return Routes.login;
  }

  if (loggingIn) {
    return Routes.home;
  }
  return null;
}
