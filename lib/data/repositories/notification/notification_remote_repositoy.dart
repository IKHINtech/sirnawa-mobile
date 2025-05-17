import 'package:sirnawa_mobile/data/repositories/notification/notification_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/notification/notification_request_model.dart';
import 'package:sirnawa_mobile/data/services/api/notification_services.dart';
import 'package:sirnawa_mobile/domain/model/notification/notification_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class NotificationRepositoryRemote implements NotificationRepository {
  NotificationRepositoryRemote({required NotificationService blockService})
    : _blockService = blockService;

  final NotificationService _blockService;

  @override
  Future<Result<ApiResponse<List<NotificationModel>>>> getListNotification(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      return await _blockService.getNotifications(queryParams);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> createNotification(
    NotificationRequestModel block,
  ) async {
    try {
      return await _blockService.createNotification(block);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateNotification(
    String id,
    NotificationRequestModel block,
  ) async {
    try {
      return await _blockService.updateNotification(id, block);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    try {
      return await _blockService.deleteNotification(id);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> readNotification(String id) async {
    try {
      return await _blockService.readNotification(id);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> readAll() async {
    try {
      return await _blockService.readAll();
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<int?>> unreadCount() async {
    try {
      return await _blockService.unreadCount();
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
