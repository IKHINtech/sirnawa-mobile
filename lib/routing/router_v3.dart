// app_router.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sirnawa_mobile/config/auth_providers.dart';
import 'package:sirnawa_mobile/domain/model/announcement/announcement_model.dart';
import 'package:sirnawa_mobile/domain/model/block/block_model.dart';
import 'package:sirnawa_mobile/domain/model/house/house_model.dart';
import 'package:sirnawa_mobile/domain/model/item/item_model.dart';
import 'package:sirnawa_mobile/domain/model/resident/resident_model.dart';
import 'package:sirnawa_mobile/domain/model/ronda_group/ronda_group_model.dart';
import 'package:sirnawa_mobile/domain/model/rw/rw_model.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/admin/announcement/widget/announcement_detail_screen.dart';
import 'package:sirnawa_mobile/ui/admin/announcement/widget/announcement_form_screen.dart';
import 'package:sirnawa_mobile/ui/admin/announcement/widget/announcement_screen.dart';
import 'package:sirnawa_mobile/ui/admin/block/widget/block_form_screen.dart';
import 'package:sirnawa_mobile/ui/admin/block/widget/block_screen.dart';
import 'package:sirnawa_mobile/ui/admin/house/widgets/house_detail_screen.dart';
import 'package:sirnawa_mobile/ui/admin/house/widgets/house_form_screen.dart';
import 'package:sirnawa_mobile/ui/admin/house/widgets/house_screen_v2.dart';
import 'package:sirnawa_mobile/ui/admin/item/widgets/item_form_screen.dart';
import 'package:sirnawa_mobile/ui/admin/item/widgets/item_screen.dart';
import 'package:sirnawa_mobile/ui/admin/resident/widget/resident_form_screen.dart';
import 'package:sirnawa_mobile/ui/admin/resident/widget/resident_screen.dart';
import 'package:sirnawa_mobile/ui/admin/ronda_group/widgets/ronda_form_screen.dart';
import 'package:sirnawa_mobile/ui/admin/ronda_group/widgets/ronda_group_detail_screen.dart';
import 'package:sirnawa_mobile/ui/admin/ronda_group/widgets/ronda_group_screen.dart';
import 'package:sirnawa_mobile/ui/admin/ronda_schedule/widgets/ronda_schedule_screen.dart';
import 'package:sirnawa_mobile/ui/admin/rt/widget/rt_screen.dart';
import 'package:sirnawa_mobile/ui/admin/rw/widget/rw_form_screen.dart';
import 'package:sirnawa_mobile/ui/admin/rw/widget/rw_screen.dart';
import 'package:sirnawa_mobile/ui/admin/widgets/admin_screen.dart';
import 'package:sirnawa_mobile/ui/auth/login/widgets/login_screen.dart';
import 'package:sirnawa_mobile/ui/community/widgets/community_screen.dart';
import 'package:sirnawa_mobile/ui/home/widgets/home_screen.dart';
import 'package:sirnawa_mobile/ui/home/widgets/home_sheel.dart';
import 'package:sirnawa_mobile/ui/profile/widgets/profile_screen.dart';
import 'package:sirnawa_mobile/ui/warung/widgets/warung_screen.dart';

class AuthRouterNotifier extends ChangeNotifier {
  final Ref _ref;
  ProviderSubscription<AsyncValue<bool>>? _sub;
  bool _isAuthenticated = false;

  AuthRouterNotifier(this._ref) {
    // Initialize with current auth state
    _updateAuthState();

    // Listen to auth state changes
    _sub = _ref.listen<AsyncValue<bool>>(authStateProvider, (
      _,
      AsyncValue<bool> newState,
    ) {
      newState.when(
        data: (isAuth) {
          if (_isAuthenticated != isAuth) {
            _isAuthenticated = isAuth;
            notifyListeners();
          }
        },
        error: (_, __) => _isAuthenticated = false,
        loading: () => null,
      );
    });
  }

  Future<void> _updateAuthState() async {
    final authRepo = _ref.read(authRepositoryProvider);
    _isAuthenticated = await authRepo.isAuthenticated;
    notifyListeners();
  }

  String? redirectLogic(BuildContext context, GoRouterState state) {
    final isLoginRoute = state.matchedLocation == Routes.login;

    if (!_isAuthenticated && !isLoginRoute) return Routes.login;
    if (_isAuthenticated && isLoginRoute) return Routes.home;
    return null;
  }

  @override
  void dispose() {
    _sub?.close();
    super.dispose();
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  final authNotifier = AuthRouterNotifier(ref);
  return GoRouter(
    refreshListenable: authNotifier,
    initialLocation: Routes.home,
    debugLogDiagnostics: true,
    redirect: authNotifier.redirectLogic,
    routes: [
      GoRoute(
        path: Routes.login,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: Routes.admin,
        builder: (context, state) => const AdminScreen(),
      ),

      // ===== RONDA SCHEDULE =====
      GoRoute(
        path: Routes.adminRondaSchedule,
        builder: (context, state) => const RondaScheduleScreen(),
      ),
      GoRoute(
        path: Routes.adminRondaGroupCreate,
        builder: (context, state) => const RondaFormScreen(),
      ),
      GoRoute(
        path: "${Routes.adminRondaSchedule}/:id",
        builder: (context, state) {
          return RondaGroupDetailScreen(
            rondaGroupId: state.pathParameters['id']!,
          );
        },
      ),
      GoRoute(
        path: Routes.adminRondaGroupUpdate,
        builder: (context, state) {
          final rondaGroup = state.extra as RondaGroupModel;
          return RondaFormScreen(rondaGroup: rondaGroup);
        },
      ),
      // ===== RONDA GROUP =====
      GoRoute(
        path: Routes.adminRondaGroup,
        builder: (context, state) => const GroupRondaScreen(),
      ),
      GoRoute(
        path: Routes.adminRondaGroupCreate,
        builder: (context, state) => const RondaFormScreen(),
      ),
      GoRoute(
        path: "${Routes.adminRondaGroup}/:id",
        builder: (context, state) {
          return RondaGroupDetailScreen(
            rondaGroupId: state.pathParameters['id']!,
          );
        },
      ),
      GoRoute(
        path: Routes.adminRondaGroupUpdate,
        builder: (context, state) {
          final rondaGroup = state.extra as RondaGroupModel;
          return RondaFormScreen(rondaGroup: rondaGroup);
        },
      ),

      //  ===== ITEM =====
      GoRoute(
        path: Routes.item,
        builder: (context, state) => const ItemListScreen(),
      ),
      GoRoute(
        path: Routes.itemCreate,
        builder: (context, state) => const ItemFormScreen(),
      ),
      GoRoute(
        path: Routes.itemUpdate,
        builder: (context, state) {
          final item = state.extra as ItemModel;
          return ItemFormScreen(item: item);
        },
      ),
      //  ===== ANNOUNCEMENT =====
      GoRoute(
        path: Routes.announcement,
        builder: (context, state) => const AnnouncementScreen(),
      ),
      GoRoute(
        path: Routes.announcementCreate,
        builder: (context, state) => const AnnouncementFormScreen(),
      ),
      GoRoute(
        path: Routes.announcementDetail,
        builder: (context, state) {
          final announcement = state.extra as AnnouncementModel;
          return AnnouncementDetailScreen(announcement: announcement);
        },
      ),
      //  ===== RT =====
      GoRoute(
        path: Routes.adminRt,
        builder: (context, state) => const RtScreen(),
      ),
      //  ===== RW =====
      GoRoute(
        path: Routes.adminRw,
        builder: (context, state) => const RwScreen(),
      ),
      GoRoute(
        path: Routes.adminRwCreate,
        builder: (context, state) => const RwFormScreen(),
      ),
      GoRoute(
        path: Routes.adminRwUpdate,
        builder: (context, state) {
          final data = state.extra as RwModel;

          return RwFormScreen(rw: data);
        },
      ),
      //  ===== BLOCK =====
      GoRoute(
        path: Routes.adminBlock,
        builder: (context, state) => const BlockScreen(),
      ),
      GoRoute(
        path: Routes.adminBlockCreate,
        builder: (context, state) => const BlockFormScreen(),
      ),
      GoRoute(
        path: Routes.adminBlockUpdate,
        builder: (context, state) {
          final block = state.extra as BlockModel;
          return BlockFormScreen(block: block);
        },
      ),
      //  ===== RESIDENT =====
      GoRoute(
        path: Routes.adminResident,
        builder: (context, state) => const ResidentScreen(), // Create mode
      ),
      GoRoute(
        path: Routes.adminResidentCreate,
        builder: (context, state) => const ResidentFormScreen(), // Create mode
      ),
      GoRoute(
        path: Routes.adminResidentEdit,
        builder: (context, state) {
          final resident =
              state.extra as ResidentModel; // extra untuk passing data
          return ResidentFormScreen(resident: resident); // Edit mode
        },
      ),
      //  ===== HOUSE  =====
      GoRoute(
        path: Routes.houseList,
        builder: (context, state) => const HouseScreenV2(), // Create mode
      ),
      GoRoute(
        path: Routes.houseCreate,
        builder: (context, state) => const HouseFormScreen(), // Create mode
      ),

      GoRoute(
        path: "${Routes.houseDetail}/:id",
        builder: (context, state) {
          return HouseDetailScreen(houseId: state.pathParameters['id']!);
        },
      ),
      GoRoute(
        path: Routes.houseEdit,
        builder: (context, state) {
          final house = state.extra as HouseModel; // extra untuk passing data
          // final houseId = state.pathParameters['id']!;
          return HouseFormScreen(house: house); // Edit mode
        },
      ),
      ShellRoute(
        builder: (context, state, child) => HomeShell(child: child),
        routes: [
          GoRoute(
            path: Routes.home,
            pageBuilder:
                (context, state) => NoTransitionPage(child: const HomeScreen()),
          ),
          GoRoute(
            path: Routes.profile,
            pageBuilder:
                (context, state) =>
                    NoTransitionPage(child: const ProfileScreen()),
          ),
          GoRoute(
            path: Routes.warung,
            pageBuilder:
                (context, state) =>
                    NoTransitionPage(child: const WarungScreen()),
          ),
          GoRoute(
            path: Routes.community,
            pageBuilder:
                (context, state) =>
                    NoTransitionPage(child: const CommunityScreen()),
          ),
        ],
      ),
    ],
  );
});
