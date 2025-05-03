import 'dart:async';

import 'package:logging/logging.dart';
import 'package:sirnawa_mobile/data/services/api/user_services.dart';
import 'package:sirnawa_mobile/data/services/share_preference_service.dart';

import '../../../utils/result.dart';
import '../../services/api/api_client.dart';
import '../../services/api/auth_api_client.dart';
import '../../services/api/model/login_request/login_request.dart';
import '../../services/api/model/login_response/login_response.dart';
import 'auth_repository.dart';

class AuthRepositoryRemote implements AuthRepository {
  AuthRepositoryRemote({
    required ApiClient apiClient,
    required AuthApiClient authApiClient,
    required UserService userService,
    required SharedPreferencesService sharedPreferencesService,
  }) : _apiClient = apiClient,
       _authApiClient = authApiClient,
       _userService = userService,
       _sharedPreferencesService = sharedPreferencesService {
    _apiClient.authHeaderProvider = _authHeaderProvider;
    _apiClient.setRefreshTokenCallback(_refreshToken);
    _init();
    // Initialize stream controller
    _authController = StreamController<bool>.broadcast();
  }

  Future<void> _init() async {
    // Load initial auth state
    await isAuthenticated;
  }

  final AuthApiClient _authApiClient;
  final ApiClient _apiClient;
  final SharedPreferencesService _sharedPreferencesService;
  final UserService _userService;
  final _log = Logger('AuthRepositoryRemote');

  bool? _isAuthenticated;
  String? _authToken;
  String? _refreshTokenValue;
  late final StreamController<bool> _authController;

  // Helper method to update auth state and notify listeners
  void _updateAuthState(bool isAuthenticated) {
    _isAuthenticated = isAuthenticated;
    _authController.add(isAuthenticated);
  }

  @override
  Stream<bool> get authStateChanges => _authController.stream;

  Future<String?> _refreshToken() async {
    try {
      final Result<String?> refreshToken =
          await _sharedPreferencesService.fetchRefreshToken();
      if (refreshToken is Error<String?>) {
        return null;
      }

      if (refreshToken is Ok<String?> && refreshToken.value != null) {
        final result = await _userService.refreshToken(
          refreshToken: refreshToken.value!,
        );
        switch (result) {
          case Ok<LoginResponse>():
            _log.info('Token refreshed');
            _authToken = result.value.accessToken.token;
            await _sharedPreferencesService.saveToken(_authToken);
            _updateAuthState(true);
            return _authToken;
          case Error<LoginResponse>():
            _log.warning('Error refreshing token: ${result.error}');
            _updateAuthState(false);
            return null;
        }
      }
      return null;
    } catch (e) {
      _log.warning('Error refreshing token: $e');
      _updateAuthState(false);
      return null;
    }
  }

  @override
  Future<bool> get isAuthenticated async {
    if (_isAuthenticated != null) return _isAuthenticated!;

    final result = await _sharedPreferencesService.fetchToken();
    switch (result) {
      case Ok<String?>():
        _authToken = result.value;
        final authenticated = result.value != null;
        _updateAuthState(authenticated);
        return authenticated;
      case Error<String?>():
        _log.severe('Failed to fetch token', result.error);
        _updateAuthState(false);
        return false;
    }
  }

  @override
  Future<Result<LoginResponse>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _authApiClient.login(
        LoginRequest(email: email, password: password),
      );

      switch (result) {
        case Ok<LoginResponse>():
          _log.info('User logged in');
          _authToken = result.value.accessToken.token;
          _refreshTokenValue = result.value.accessToken.refreshToken;
          await _sharedPreferencesService.saveToken(_authToken);
          await _sharedPreferencesService.saveRefreshToken(_refreshTokenValue);
          _updateAuthState(true);
          return Result.ok(result.value);
        case Error<LoginResponse>():
          _log.warning('Login failed: ${result.error}');
          _updateAuthState(false);
          return Result.error(result.error);
      }
    } catch (e) {
      _log.severe('Login exception', e);
      _updateAuthState(false);
      return Result.error(Exception(e));
    }
  }

  @override
  Future<Result<void>> logout() async {
    _log.info('Logging out');
    try {
      final result = await _sharedPreferencesService.saveToken(null);
      if (result is Error<void>) {
        _log.severe('Failed to clear token');
        return result;
      }

      final resultval = await _sharedPreferencesService.saveRefreshToken(null);
      if (result is Error<void>) {
        _log.severe('Failed to clear token');
        return resultval;
      }

      _authToken = null;
      _updateAuthState(false);
      return const Result.ok(null);
    } catch (e) {
      _log.severe('Logout exception', e);
      return Result.error(Exception('Logout failed'));
    }
  }

  String? _authHeaderProvider() =>
      _authToken != null ? 'Bearer $_authToken' : null;

  void dispose() {
    _authController.close();
  }
}
