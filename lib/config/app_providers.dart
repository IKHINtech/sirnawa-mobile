import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/auth_providers.dart';
import 'package:sirnawa_mobile/data/repositories/auth/auth_repository.dart';
import 'package:sirnawa_mobile/data/repositories/block/block_repository.dart';
import 'package:sirnawa_mobile/data/repositories/block/block_repository_remote.dart';
import 'package:sirnawa_mobile/data/repositories/housing_area/housing_area_reposiory_remote.dart';
import 'package:sirnawa_mobile/data/repositories/housing_area/housing_area_repository.dart';
import 'package:sirnawa_mobile/data/repositories/resident/resident_repository.dart';
import 'package:sirnawa_mobile/data/repositories/resident/resident_repository_remote.dart';
import 'package:sirnawa_mobile/data/repositories/ronda_group/ronda_group_repository.dart';
import 'package:sirnawa_mobile/data/repositories/ronda_group/ronda_group_repository_remote.dart';
import 'package:sirnawa_mobile/data/repositories/rt/rt_repository.dart';
import 'package:sirnawa_mobile/data/repositories/rt/rt_repository_remote.dart';
import 'package:sirnawa_mobile/data/repositories/rw/rw_repository.dart';
import 'package:sirnawa_mobile/data/repositories/rw/rw_repository_remote.dart';
import 'package:sirnawa_mobile/data/repositories/user/user_repository.dart';
import 'package:sirnawa_mobile/data/repositories/user/user_repository_remote.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/auth_api_client.dart';
import 'package:sirnawa_mobile/data/services/api/block_services.dart';
import 'package:sirnawa_mobile/data/services/api/housing_area_services.dart';
import 'package:sirnawa_mobile/data/services/api/resident_services.dart';
import 'package:sirnawa_mobile/data/services/api/ronda_group_services.dart';
import 'package:sirnawa_mobile/data/services/api/rt_services.dart';
import 'package:sirnawa_mobile/data/services/api/rw_services.dart';
import 'package:sirnawa_mobile/data/services/api/user_services.dart';
import 'package:sirnawa_mobile/data/services/share_preference_service.dart';
import 'package:sirnawa_mobile/ui/admin/block/block_view_model/block_viewmodel.dart';
import 'package:sirnawa_mobile/ui/admin/housing_area/housing_area_viewmodel/housing_area_viewmodel.dart';
import 'package:sirnawa_mobile/ui/admin/resident/resident_view_model/resident_viewmodel.dart';
import 'package:sirnawa_mobile/ui/admin/ronda_group/ronda_group_viewmodel/ronda_group_viewmodel.dart';
import 'package:sirnawa_mobile/ui/admin/rt/rt_viewmodel/rt_viewmodel.dart';
import 'package:sirnawa_mobile/ui/admin/rw/rw_viewmodel/rw_viewmodel.dart';
import 'package:sirnawa_mobile/ui/auth/login/view_models/login_viewmodel.dart';
import 'package:sirnawa_mobile/ui/home/view_models/home_viewmodel.dart';

// ========== Services Providers ========== //
final Provider<AuthApiClient> authApiClientProvider = Provider<AuthApiClient>(
  (Ref<AuthApiClient> ref) => AuthApiClient(),
);

final Provider<ApiClient> apiClientProvider = Provider<ApiClient>((
  Ref<ApiClient> ref,
) {
  return ApiClient();
});

final Provider<SharedPreferencesService> sharedPreferencesServiceProvider =
    Provider<SharedPreferencesService>((Ref<SharedPreferencesService> ref) {
      return SharedPreferencesService();
    });

// ========== Housing Area ========== //
final Provider<HousingAreaService> housingAreaServiceProvider =
    Provider<HousingAreaService>((Ref<HousingAreaService> ref) {
      return HousingAreaService(ref.read<ApiClient>(apiClientProvider));
    });

final Provider<HousingAreaRepository> housingAreaRepositoryProvider =
    Provider<HousingAreaRepository>((Ref<HousingAreaRepository> ref) {
      return HousingAreaRepositoryRemote(
        housingAreaService: ref.read<HousingAreaService>(
          housingAreaServiceProvider,
        ),
      );
    });

final StateNotifierProvider<HousingAreaViewModel, HousingAreaState>
housingAreaViewModelProvider =
    StateNotifierProvider<HousingAreaViewModel, HousingAreaState>((ref) {
      return HousingAreaViewModel(
        repository: ref.read<HousingAreaRepository>(
          housingAreaRepositoryProvider,
        ),
      );
    });

// ========== RT ========== //
final Provider<RtService> rtServiceProvider = Provider<RtService>((
  Ref<RtService> ref,
) {
  return RtService(ref.read<ApiClient>(apiClientProvider));
});

final Provider<RtRepository> rtRepositoryProvider = Provider<RtRepository>((
  Ref<RtRepository> ref,
) {
  return RtRepositoryRemote(rtService: ref.read<RtService>(rtServiceProvider));
});

final StateNotifierProvider<RtViewModel, RtState> rtViewModelProvider =
    StateNotifierProvider<RtViewModel, RtState>((ref) {
      return RtViewModel(
        repository: ref.read<RtRepository>(rtRepositoryProvider),
      );
    });

// ========== Ronda Group ========== //
final Provider<RondaGroupService> rondaGroupServiceProvider =
    Provider<RondaGroupService>((Ref<RondaGroupService> ref) {
      return RondaGroupService(ref.read<ApiClient>(apiClientProvider));
    });

final Provider<RondaGroupRepository> rondaGroupRepositoryProvider =
    Provider<RondaGroupRepository>((Ref<RondaGroupRepository> ref) {
      return RondaGroupRepositoryRemote(
        rondaGroupService: ref.read<RondaGroupService>(
          rondaGroupServiceProvider,
        ),
      );
    });

final StateNotifierProvider<RondaGroupViewModel, RondaGroupState>
rondaGroupViewModelProvider =
    StateNotifierProvider<RondaGroupViewModel, RondaGroupState>((ref) {
      return RondaGroupViewModel(
        repository: ref.read<RondaGroupRepository>(
          rondaGroupRepositoryProvider,
        ),
      );
    });

// ========== RW ========== //
final Provider<RwService> rwServiceProvider = Provider<RwService>((
  Ref<RwService> ref,
) {
  return RwService(ref.read<ApiClient>(apiClientProvider));
});

final Provider<RwRepository> rwRepositoryProvider = Provider<RwRepository>((
  Ref<RwRepository> ref,
) {
  return RwRepositoryRemote(rwService: ref.read<RwService>(rwServiceProvider));
});

final StateNotifierProvider<RwViewModel, RwState> rwViewModelProvider =
    StateNotifierProvider<RwViewModel, RwState>((ref) {
      return RwViewModel(
        repository: ref.read<RwRepository>(rwRepositoryProvider),
      );
    });

// ===== RESIDENT ========= //
final Provider<ResidentService> residentServiceProvider =
    Provider<ResidentService>((Ref<ResidentService> ref) {
      return ResidentService(ref.read<ApiClient>(apiClientProvider));
    });

final Provider<ResidentRepository> residentRepositoryProvider =
    Provider<ResidentRepository>((Ref<ResidentRepository> ref) {
      return ResidentRepositoryRemote(
        residentService: ref.read<ResidentService>(residentServiceProvider),
      );
    });

final StateNotifierProvider<ResidentViewModel, ResidentState>
residentViewModelProvider =
    StateNotifierProvider<ResidentViewModel, ResidentState>((ref) {
      return ResidentViewModel(
        repository: ref.read<ResidentRepository>(residentRepositoryProvider),
      );
    });

// ========== BLOCK ========== //
final Provider<BlockService> blockServiceProvider = Provider<BlockService>((
  Ref<BlockService> ref,
) {
  return BlockService(ref.read<ApiClient>(apiClientProvider));
});

final Provider<BlockRepository> blockRepositoryProvider =
    Provider<BlockRepository>((Ref<BlockRepository> ref) {
      return BlockRepositoryRemote(
        blockService: ref.read<BlockService>(blockServiceProvider),
      );
    });

final StateNotifierProvider<BlockViewModel, BlockState> blockViewModelProvider =
    StateNotifierProvider<BlockViewModel, BlockState>((ref) {
      return BlockViewModel(
        repository: ref.read<BlockRepository>(blockRepositoryProvider),
      );
    });

// ========== USER ========== //
final Provider<UserService> userServiceProvider = Provider<UserService>((
  Ref<UserService> ref,
) {
  return UserService(ref.read<ApiClient>(apiClientProvider));
});
final Provider<UserRepository> userRepositoryProvider =
    Provider<UserRepository>((Ref<UserRepository> ref) {
      return UserRepositoryRemote(
        userService: ref.read<UserService>(userServiceProvider),
      );
    });

// ========== HOME  ========== //
final StateNotifierProvider<HomeViewModel, HomeState> homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, HomeState>((ref) {
      return HomeViewModel(
        userRepo: ref.read<UserRepository>(userRepositoryProvider),
        authRepository: ref.read<AuthRepository>(authRepositoryProvider),
      );
    });

// ========= Login View Model =========  //
final StateNotifierProvider<LoginViewModel, LoginState> loginViewModelProvider =
    StateNotifierProvider<LoginViewModel, LoginState>((ref) {
      return LoginViewModel(
        authRepository: ref.watch<AuthRepository>(authRepositoryProvider),
      );
    });
