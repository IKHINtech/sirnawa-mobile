import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/config/app_config.dart';
import 'package:sirnawa_mobile/data/services/api/model/login_request/login_request.dart';
import 'package:sirnawa_mobile/data/services/api/model/login_response/login_response.dart';
import 'package:sirnawa_mobile/utils/error_parser.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class AuthApiClient {
  AuthApiClient({Dio? dio})
    : _dio = dio ?? Dio(BaseOptions(baseUrl: AppConfig.apiBaseUrl));

  final Dio _dio;

  Future<Result<LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: loginRequest.toJson(),
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        return Result.ok(LoginResponse.fromJson(response.data["data"]));
      } else {
        return Result.error(Exception("Login error"));
      }
    } on DioException catch (error) {
      return Result.error(Exception(parseDioError(error)));
    } catch (error) {
      return Result.error(Exception(parseDioError(error)));
    }
  }

  Future<Result<LoginResponse>> refreshToken() async {
    try {
      final response = await _dio.post(
        '/auth/refresh-token',
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        return Result.ok(LoginResponse.fromJson(response.data["data"]));
      } else {
        return Result.error(Exception("Login error"));
      }
    } on DioException catch (error) {
      return Result.error(error);
    } catch (error) {
      return Result.error(Exception(error));
    }
  }
}
