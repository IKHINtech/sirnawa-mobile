import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/result.dart';

class SharedPreferencesService {
  static const _tokenKey = 'TOKEN';
  static const _refreshTokenKey = 'REFRESH_TOKEN';
  final _log = Logger('SharedPreferencesService');

  Future<Result<String?>> fetchToken() async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      _log.finer('Got token from SharedPreferences');
      return Result<String?>.ok(sharedPreferences.getString(_tokenKey));
    } on Exception catch (e) {
      _log.warning('Failed to get token', e);
      return Result<String?>.error(e);
    }
  }

  Future<Result<String?>> fetchRefreshToken() async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      _log.finer('Got token from SharedPreferences');
      return Result<String?>.ok(sharedPreferences.getString(_refreshTokenKey));
    } on Exception catch (e) {
      _log.warning('Failed to get token', e);
      return Result<String?>.error(e);
    }
  }

  Future<Result<void>> saveRefreshToken(String? refreshToken) async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      if (refreshToken == null) {
        _log.finer('Removed Refresh token');
        await sharedPreferences.remove(_refreshTokenKey);
      } else {
        _log.finer('Replaced Refresh token');
        await sharedPreferences.setString(_refreshTokenKey, refreshToken);
      }
      return const Result.ok(null);
    } on Exception catch (e) {
      _log.warning('Failed to set token', e);
      return Result.error(e);
    }
  }

  Future<Result<void>> saveToken(String? token) async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      if (token == null) {
        _log.finer('Removed token');
        await sharedPreferences.remove(_tokenKey);
      } else {
        _log.finer('Replaced token');
        await sharedPreferences.setString(_tokenKey, token);
      }
      return const Result.ok(null);
    } on Exception catch (e) {
      _log.warning('Failed to set token', e);
      return Result.error(e);
    }
  }
}
