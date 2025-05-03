import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sirnawa_mobile/config/app_config.dart';
import 'package:sirnawa_mobile/data/services/api/dio_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/login_request/login_request.dart';
import 'package:sirnawa_mobile/data/services/api/model/login_response/login_response.dart';
import 'package:sirnawa_mobile/utils/error_parser.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class AuthApiClient {
  AuthApiClient({Dio? dio})
    : _dio = dio ?? DioClient.create(baseUrl: AppConfig.apiBaseUrl);

  final Dio _dio;

  Future<Result<LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      final Response<dynamic> response = await _dio.post(
        '/auth/login',
        data: loginRequest.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      // DEBUG: Cek cookies setelah login
      if (!kIsWeb) {
        final cookies = await DioClient.cookieJar.loadForRequest(
          Uri.parse(AppConfig.apiBaseUrl),
        );
        debugPrint('Cookies after login: $cookies');
      }

      if (response.statusCode == 200) {
        return Result<LoginResponse>.ok(
          LoginResponse.fromJson(response.data["data"]),
        );
      } else {
        return Result<LoginResponse>.error(Exception("Login error"));
      }
    } on DioException catch (error) {
      return Result<LoginResponse>.error(Exception(parseDioError(error)));
    } catch (error) {
      return Result<LoginResponse>.error(Exception(parseDioError(error)));
    }
  }

  Future<Result<LoginResponse>> refreshToken() async {
    try {
      final Response<dynamic> response = await _dio.post(
        '/auth/refresh-token',
        options: Options(
          headers: {'Content-Type': 'application/json'},
          extra: kIsWeb ? {'withCredentials': true} : {},
        ),
      );

      if (response.statusCode == 200) {
        return Result<LoginResponse>.ok(
          LoginResponse.fromJson(response.data["data"]),
        );
      } else {
        return Result<LoginResponse>.error(Exception("Login error"));
      }
    } on DioException catch (error) {
      return Result<LoginResponse>.error(error);
    } catch (error) {
      return Result<LoginResponse>.error(Exception(error));
    }
  }
}
