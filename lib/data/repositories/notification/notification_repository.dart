import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/notification/notification_request_model.dart';
import 'package:sirnawa_mobile/domain/model/notification/notification_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

abstract class NotificationRepository {
  Future<Result<ApiResponse<List<NotificationModel>>>> getListNotification(
    Map<String, dynamic>? queryParams,
  );
  Future<Result<void>> createNotification(
    NotificationRequestModel notification,
  );
  Future<Result<void>> updateNotification(
    String id,
    NotificationRequestModel notification,
  );
  Future<Result<void>> delete(String id);
  Future<Result<void>> readNotification(String id);
  Future<Result<void>> readAll();
  Future<Result<int?>> unreadCount();
}
