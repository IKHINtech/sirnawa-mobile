import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:sirnawa_mobile/data/repositories/auth/auth_repository.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class LoginState {
  final bool isLoading;
  final String? error;
  final AsyncValue<void> loginStatus;

  const LoginState({
    required this.isLoading,
    required this.error,
    required this.loginStatus,
  });

  LoginState copyWith({
    bool? isLoading,
    String? error,
    bool clearError = false,
    AsyncValue<void>? loginStatus,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : error ?? this.error, 
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }

  factory LoginState.initial() {
    return const LoginState(
      isLoading: false,
      error: null,
      loginStatus: AsyncValue.data(null),
    );
  }
}

class LoginViewModel extends StateNotifier<LoginState> {
  final AuthRepository _authRepository;
  final Logger _log = Logger('LoginViewModel');

  LoginViewModel({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(LoginState.initial());

  Future<bool> login(String email, String password) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
      clearError: true,
      loginStatus: const AsyncValue.loading(),
    );

    final result = await AsyncValue.guard(
      () => _authRepository.login(email: email, password: password),
    );

    return result.when(
      data: (response) {
        switch (response) {
          case Ok():
            _log.info('User logged in');
            state = state.copyWith(
              isLoading: false,
              loginStatus: result,
              error: null,
            );
            return true;
          case Error():
            _log.warning('Login failed: ${response.error}');
            state = state.copyWith(
              isLoading: false,
              loginStatus: result,
              error: response.error.toString(),
            );
            return false;
        }
      },
      error: (err, stack) {
        _log.severe('Login threw exception: $err');
        state = state.copyWith(
          isLoading: false,
          loginStatus: result,
          error: err.toString(),
        );
        return false;
      },
      loading: () => false, // tidak akan pernah terjadi di sini
    );
  }
}
