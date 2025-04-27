import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_config.dart';
import 'package:sirnawa_mobile/config/auth_providers.dart';
import 'package:sirnawa_mobile/data/repositories/block/block_repository.dart';
import 'package:sirnawa_mobile/data/repositories/block/block_repository_remote.dart';
import 'package:sirnawa_mobile/data/repositories/resident/resident_repository.dart';
import 'package:sirnawa_mobile/data/repositories/resident/resident_repository_remote.dart';
import 'package:sirnawa_mobile/data/repositories/rt/rt_repository.dart';
import 'package:sirnawa_mobile/data/repositories/rt/rt_repository_remote.dart';
import 'package:sirnawa_mobile/data/repositories/rw/rw_repository.dart';
import 'package:sirnawa_mobile/data/repositories/rw/rw_repository_remote.dart';
import 'package:sirnawa_mobile/data/repositories/user/user_repository.dart';
import 'package:sirnawa_mobile/data/repositories/user/user_repository_remote.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/auth_api_client.dart';
import 'package:sirnawa_mobile/data/services/api/block_services.dart';
import 'package:sirnawa_mobile/data/services/api/resident_services.dart';
import 'package:sirnawa_mobile/data/services/api/rt_services.dart';
import 'package:sirnawa_mobile/data/services/api/rw_services.dart';
import 'package:sirnawa_mobile/data/services/api/user_services.dart';
import 'package:sirnawa_mobile/data/services/share_preference_service.dart';
import 'package:sirnawa_mobile/ui/admin/block/block_view_model/block_viewmodel.dart';
import 'package:sirnawa_mobile/ui/admin/resident/resident_view_model/resident_viewmodel.dart';
import 'package:sirnawa_mobile/ui/admin/rt/rt_viewmodel/rt_viewmodel.dart';
import 'package:sirnawa_mobile/ui/admin/rw/rw_viewmodel/rw_viewmodel.dart';
import 'package:sirnawa_mobile/ui/auth/login/view_models/login_viewmodel.dart';
import 'package:sirnawa_mobile/ui/home/view_models/home_viewmodel.dart';

// ========== Services Providers ==========
final authApiClientProvider = Provider<AuthApiClient>((ref) => AuthApiClient());

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(baseUrl: AppConfig.apiBaseUrl);
});

final sharedPreferencesServiceProvider = Provider<SharedPreferencesService>((
  ref,
) {
  return SharedPreferencesService();
});

// ========== RT ==========

final rtServiceProvider = Provider<RtService>((ref) {
  return RtService(ref.read(apiClientProvider));
});

final rtRepositoryProvider = Provider<RtRepository>((ref) {
  return RtRepositoryRemote(rtService: ref.read(rtServiceProvider));
});

final rtViewModelProvider = StateNotifierProvider<RtViewModel, RtState>((ref) {
  return RtViewModel(repository: ref.read(rtRepositoryProvider));
});

// ========== RW ==========
final rwServiceProvider = Provider<RwService>((ref) {
  return RwService(ref.read(apiClientProvider));
});

final rwRepositoryProvider = Provider<RwRepository>((ref) {
  return RwRepositoryRemote(rwService: ref.read(rwServiceProvider));
});

final rwViewModelProvider = StateNotifierProvider<RwViewModel, RwState>((ref) {
  return RwViewModel(repository: ref.read(rwRepositoryProvider));
});
//===== RESIDENT =========//
final residentServiceProvider = Provider<ResidentService>((ref) {
  return ResidentService(ref.read(apiClientProvider));
});

final residentRepositoryProvider = Provider<ResidentRepository>((ref) {
  return ResidentRepositoryRemote(
    residentService: ref.read(residentServiceProvider),
  );
});

final residentViewModelProvider =
    StateNotifierProvider<ResidentViewModel, ResidentState>((ref) {
      return ResidentViewModel(
        repository: ref.read(residentRepositoryProvider),
      );
    });

//========== BLOCK ==========//

final blockServiceProvider = Provider<BlockService>((ref) {
  return BlockService(ref.read(apiClientProvider));
});

final blockRepositoryProvider = Provider<BlockRepository>((ref) {
  return BlockRepositoryRemote(blockService: ref.read(blockServiceProvider));
});

final blockViewModelProvider =
    StateNotifierProvider<BlockViewModel, BlockState>((ref) {
      return BlockViewModel(repository: ref.read(blockRepositoryProvider));
    });

//========== USER ==========//
final userServiceProvider = Provider<UserService>((ref) {
  return UserService(ref.read(apiClientProvider));
});
final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryRemote(userService: ref.read(userServiceProvider));
});

// ========== HOME  ==========
final homeViewModelProvider = StateNotifierProvider<HomeViewModel, HomeState>((
  ref,
) {
  return HomeViewModel(
    userRepo: ref.read(userRepositoryProvider),
    authRepository: ref.read(authRepositoryProvider),
  );
});

// ========= Login View Model =========
final loginViewModelProvider =
    StateNotifierProvider<LoginViewModel, LoginState>((ref) {
      return LoginViewModel(authRepository: ref.watch(authRepositoryProvider));
    });
