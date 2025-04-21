import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/user/user_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class UserService {
  final ApiClient apiClient;

  UserService(this.apiClient);

  Future<Result<ApiResponse<UserModel>>> getCurrentUser() async {
    try {
      final response = await apiClient.get('/auth/me');

      final data = ApiResponse<UserModel>.fromJson(
        response.data,
        (json) => UserModel.fromJson(json as Map<String, dynamic>),
      );

      return Result.ok(data);
    } catch (e) {
      return Result.error(Exception(_parseDioError(e)));
    }
  }

  String? _parseDioError(Object error) {
    if (error is DioException) {
      return error.message;
    }
    return error.toString();
  }
}
