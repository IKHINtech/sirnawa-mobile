import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/auth_providers.dart';
import 'package:sirnawa_mobile/data/repositories/auth/auth_repository.dart';
import 'package:sirnawa_mobile/data/repositories/user/user_repository.dart';
import 'package:sirnawa_mobile/data/repositories/user/user_repository_remote.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/auth_api_client.dart';
import 'package:sirnawa_mobile/data/services/api/user_services.dart';
import 'package:sirnawa_mobile/data/services/share_preference_service.dart';
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

final selectedBlockProvider = StateProvider<String>((ref) {
  // Nilai default: block ID dari rumah resident
  final homeState = ref.watch(homeViewModelProvider);
  return homeState.residentHouse?.house!.block?.id ?? "";
});
// ========= Login View Model =========  //
final StateNotifierProvider<LoginViewModel, LoginState> loginViewModelProvider =
    StateNotifierProvider<LoginViewModel, LoginState>((ref) {
      return LoginViewModel(
        authRepository: ref.watch<AuthRepository>(authRepositoryProvider),
      );
    });
