import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/login_response/login_response.dart';
import 'package:sirnawa_mobile/domain/model/user/user_model.dart';
import 'package:sirnawa_mobile/utils/error_parser.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class UserService {
  final ApiClient apiClient;

  UserService(this.apiClient);

  Future<Result<LoginResponse>> refreshToken({
    required String refreshToken,
  }) async {
    try {
      final Response<dynamic> response = await apiClient.post(
        '/auth/refresh-token',
        data: {"refresh_token": refreshToken},
      );

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

  Future<Result<ApiResponse<UserModel>>> getCurrentUser() async {
    try {
      final Response<dynamic> response = await apiClient.get('/auth/me');

      final ApiResponse<UserModel> data = ApiResponse<UserModel>.fromJson(
        response.data,
        (json) => UserModel.fromJson(json as Map<String, dynamic>),
      );

      return Result<ApiResponse<UserModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<UserModel>>.error(Exception(parseDioError(e)));
    }
  }
}
