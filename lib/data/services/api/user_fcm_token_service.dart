import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/user_fcm_token/user_fcm_token_request_model.dart';
import 'package:sirnawa_mobile/utils/error_parser.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class UserFcmTokenService {
  final ApiClient apiClient;

  UserFcmTokenService(this.apiClient);

  // ✅ POST /fcm/register
  Future<void> createUserFcmToken(UserFcmTokenRequestModel payload) async {
    try {
      await apiClient.post('/fcm/register', data: payload.toJson());
    } catch (e) {
      throw Exception(parseDioError(e));
    }
  }

  // ✅ POST /fcm/remove
  Future<Result<void>> deleteUserFcmToken(String token) async {
    try {
      await apiClient.post('/fcm/remove', data: {'token': token});
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }
}
