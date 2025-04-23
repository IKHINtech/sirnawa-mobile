import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/repositories/auth/auth_repository.dart';
import 'package:sirnawa_mobile/data/repositories/auth/auth_repository_remote.dart';

// ========== Repository Providers ==========
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final repo = AuthRepositoryRemote(
    userService: ref.read(userServiceProvider),
    authApiClient: ref.read(authApiClientProvider),
    apiClient: ref.read(apiClientProvider),
    sharedPreferencesService: ref.read(sharedPreferencesServiceProvider),
  );
  // Auto-dispose when no longer used
  // Initialize auth state immediately
  repo.isAuthenticated;

  ref.onDispose(() {
    repo.dispose();
  });

  return repo;
});

final isAuthenticatedProvider = FutureProvider<bool>((ref) {
  return ref.watch(authRepositoryProvider).isAuthenticated;
});

final authStateProvider = StreamProvider.autoDispose<bool>((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return authRepo.authStateChanges;
});
