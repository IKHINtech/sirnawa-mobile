import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/services/api/user_fcm_token_service.dart';
import 'package:sirnawa_mobile/data/services/fcm_service.dart';
import 'package:sirnawa_mobile/ui/fcm_viewmodel/fcm_viewmodel.dart';

final firebaseMessagingProvider = Provider<FirebaseMessaging>((ref) {
  return FirebaseMessaging.instance;
});

final flutterLocalNotificationsPluginProvider =
    Provider<FlutterLocalNotificationsPlugin>((ref) {
      return FlutterLocalNotificationsPlugin();
    });

final fcmServiceProvider = FutureProvider<FCMService>((ref) async {
  final packageInfo = await ref.read(packageInfoProvider.future);
  return FCMService(
    FirebaseMessaging.instance,
    ref.read(flutterLocalNotificationsPluginProvider),
    ref.read(userFcmTokenServiceProvider),
    ref.read(deviceInfoProvider),
    packageInfo,
  );
});

final userFcmTokenServiceProvider = Provider<UserFcmTokenService>((ref) {
  return UserFcmTokenService(ref.watch(apiClientProvider));
});
// Provider untuk ViewModel
final fcmViewModelProvider =
    StateNotifierProvider<FCMViewModel, AsyncValue<void>>((ref) {
      return FCMViewModel(ref);
    });
