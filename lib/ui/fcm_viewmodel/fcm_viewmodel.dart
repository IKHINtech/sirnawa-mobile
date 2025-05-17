// fcm_viewmodel.dart
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/config/fcm_providers.dart';
import 'package:sirnawa_mobile/data/services/fcm_service.dart';

class FCMViewModel extends StateNotifier<AsyncValue<void>> {
  final Ref ref;

  FCMViewModel(this.ref) : super(const AsyncValue.data(null)) {
    initialize();
  }

  Future<void> initialize() async {
    state = const AsyncValue.loading();
    try {
      final packageInfo = await ref.read(packageInfoProvider.future);

      final fcmService = FCMService(
        ref.read(firebaseMessagingProvider),
        ref.read(flutterLocalNotificationsPluginProvider),
        ref.read(userFcmTokenServiceProvider),
        ref.read(deviceInfoProvider),
        packageInfo,
      );
      await fcmService.initialize();
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> removeFcmToken() async {
    state = const AsyncValue.loading();
    try {
      final fcmService = await ref.read(fcmServiceProvider.future);
      final messaging =
          FirebaseMessaging.instance; // Akses langsung dari FirebaseMessaging
      final token = await messaging.getToken();
      if (token != null) {
        await fcmService.removeToken(token);
      }
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
