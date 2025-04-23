import 'package:sirnawa_mobile/utils/result.dart';

abstract class AuthRepository {
  /// Returns true when the user is logged in
  /// Returns [Future] because it will load a stored auth state the first time.
  Future<bool> get isAuthenticated;
  Stream<bool> get authStateChanges;

  /// Perform login
  Future<Result<void>> login({required String email, required String password});

  /// Perform logout
  Future<Result<void>> logout();
}
