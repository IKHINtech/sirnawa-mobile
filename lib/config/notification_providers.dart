import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/repositories/notification/notification_remote_repositoy.dart';
import 'package:sirnawa_mobile/data/repositories/notification/notification_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/notification_services.dart';
import 'package:sirnawa_mobile/domain/model/notification/notification_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

// Provider untuk NotificationRepository
final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return NotificationRepositoryRemote(
    blockService: NotificationService(apiClient),
  );
});

// Provider untuk state notifikasi
final notificationsProvider = StateNotifierProvider<
  NotificationsNotifier,
  AsyncValue<List<NotificationModel>>
>((ref) {
  final repository = ref.read(notificationRepositoryProvider);
  return NotificationsNotifier(repository);
});

// Notifier untuk manajemen state notifikasi
class NotificationsNotifier
    extends StateNotifier<AsyncValue<List<NotificationModel>>> {
  final NotificationRepository _repository;

  NotificationsNotifier(this._repository) : super(const AsyncValue.loading()) {
    fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    state = const AsyncValue.loading();
    try {
      final result = await _repository.getListNotification(null);
      switch (result) {
        case Ok<ApiResponse<List<NotificationModel>>>():
          state = AsyncValue.data(result.value.data ?? []);
          break;
        case Error<ApiResponse<List<NotificationModel>>>():
          state = AsyncValue.error(result.error, StackTrace.current);
          break;
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> markAsRead(String id) async {
    final currentData = state.value;
    if (currentData == null) return;

    try {
      await _repository.readNotification(id);
      state = AsyncValue.data([
        for (final notification in currentData)
          if (notification.id == id)
            notification.copyWith(readAt: DateTime.now())
          else
            notification,
      ]);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> markAllAsRead() async {
    final currentData = state.value;
    if (currentData == null) return;

    try {
      await _repository.readAll();
      state = AsyncValue.data([
        for (final notification in currentData)
          notification.copyWith(readAt: DateTime.now()),
      ]);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteNotification(String id) async {
    final currentData = state.value;
    if (currentData == null) return;

    try {
      await _repository.delete(id);
      state = AsyncValue.data(currentData.where((n) => n.id != id).toList());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

// Provider untuk jumlah notifikasi belum dibaca
final unreadCountProvider = FutureProvider<int>((ref) async {
  final repository = ref.read(notificationRepositoryProvider);
  final result = await repository.unreadCount();
  switch (result) {
    case Ok<int?>():
      return result.value ?? 0;
    case Error<int?>():
      return 0;
  }
});
