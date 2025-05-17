import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/notification/notification_request_model.dart';
import 'package:sirnawa_mobile/domain/model/notification/notification_model.dart';
import 'package:sirnawa_mobile/utils/error_parser.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class NotificationService {
  final ApiClient apiClient;

  NotificationService(this.apiClient);

  // ✅ GET /notification
  Future<Result<ApiResponse<List<NotificationModel>>>> getNotifications(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        '/notification',
        queryParams: queryParams,
      );

      final ApiResponse<List<NotificationModel>> data =
          ApiResponse<List<NotificationModel>>.fromJson(
            response.data,
            (json) =>
                (json as List)
                    .map<NotificationModel>(
                      (e) =>
                          NotificationModel.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
          );

      return Result<ApiResponse<List<NotificationModel>>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<List<NotificationModel>>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ POST /notification
  Future<Result<ApiResponse<NotificationModel>>> createNotification(
    NotificationRequestModel payload,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.post(
        '/notification',
        data: payload.toJson(),
      );

      final ApiResponse<NotificationModel> data =
          ApiResponse<NotificationModel>.fromJson(
            response.data,
            (json) => NotificationModel.fromJson(json as Map<String, dynamic>),
          );

      return Result<ApiResponse<NotificationModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<NotificationModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ PUT /notification/{id}
  Future<Result<ApiResponse<NotificationModel>>> updateNotification(
    String id,
    NotificationRequestModel rt,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.put(
        '/notification/$id',
        data: rt.toJson(),
      );

      final ApiResponse<NotificationModel> data =
          ApiResponse<NotificationModel>.fromJson(
            response.data,
            (json) => NotificationModel.fromJson(json as Map<String, dynamic>),
          );

      return Result<ApiResponse<NotificationModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<NotificationModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ DELETE /notification/{id}
  Future<Result<void>> deleteNotification(String id) async {
    try {
      await apiClient.delete('/notification/$id');
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }

  // ✅ PATCH /notification/{id}/read
  Future<Result<void>> readNotification(String id) async {
    try {
      await apiClient.patch('/notification/$id/read');
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }

  // ✅ GET /notification/unread-count
  Future<Result<int?>> unreadCount() async {
    try {
      final Response<dynamic> response = await apiClient.get(
        '/notification/unread-count',
      );
      final data = ApiResponse<int>.fromJson(
        response.data,
        (json) => json as int,
      );
      return Result.ok(data.data);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }

  // ✅ PATCH /notification/read-all
  Future<Result<void>> readAll() async {
    try {
      await apiClient.patch('/notification/read-all');
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }
}
