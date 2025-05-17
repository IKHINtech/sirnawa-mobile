import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/notification_providers.dart';
import 'package:sirnawa_mobile/domain/model/notification/notification_model.dart';

class NotificationPage extends ConsumerWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsAsync = ref.watch(notificationsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.mark_as_unread),
            onPressed:
                () => ref.read(notificationsProvider.notifier).markAllAsRead(),
          ),
        ],
      ),
      body: notificationsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (notifications) {
          if (notifications.isEmpty) {
            return const Center(child: Text('Tidak ada notifikasi'));
          }

          return RefreshIndicator(
            onRefresh:
                () =>
                    ref
                        .read(notificationsProvider.notifier)
                        .fetchNotifications(),
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return NotificationTile(
                  notification: notification,
                  onTap: () {
                    ref
                        .read(notificationsProvider.notifier)
                        .markAsRead(notification.id!);
                    // Navigasi berdasarkan data notifikasi jika diperlukan
                  },
                  onDismissed: (direction) {
                    ref
                        .read(notificationsProvider.notifier)
                        .deleteNotification(notification.id!);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onTap;
  final DismissDirectionCallback onDismissed;

  const NotificationTile({
    super.key,
    required this.notification,
    required this.onTap,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    final isRead = notification.readAt != null;

    return Dismissible(
      key: Key(notification.id!),
      direction: DismissDirection.endToStart,
      onDismissed: onDismissed,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: ListTile(
        title: Text(
          notification.title,
          style: TextStyle(
            fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
          ),
        ),
        subtitle: Text(notification.body),
        leading: CircleAvatar(
          child: Icon(_getIconByCategory(notification.category)),
        ),

        trailing: Text(
          _formatDate(notification.createdAt),
          style: Theme.of(context).textTheme.bodySmall,
        ),
        onTap: onTap,
        tileColor:
            isRead
                ? null
                : Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
      ),
    );
  }

  IconData _getIconByCategory(String category) {
    switch (category) {
      case 'info':
        return Icons.info;
      case 'warning':
        return Icons.warning;
      case 'alert':
        return Icons.notifications_active;
      default:
        return Icons.notifications;
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.day}/${date.month}/${date.year}';
  }
}
