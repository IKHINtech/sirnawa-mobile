import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:sirnawa_mobile/data/repositories/auth/auth_repository.dart';

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
    AsyncValue<void>? loginStatus,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
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

  Future<void> login(String email, String password) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
      loginStatus: const AsyncValue.loading(),
    );

    final result = await AsyncValue.guard(
      () => _authRepository.login(email: email, password: password),
    );

    state = state.copyWith(
      isLoading: false,
      loginStatus: result,
      error: result.hasError ? result.error.toString() : null,
    );

    if (result.hasError) {
      _log.warning('Login failed! ${result.error}');
    }
  }
}
