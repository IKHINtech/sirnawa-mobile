import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sirnawa_mobile/data/services/api/model/user_fcm_token/user_fcm_token_request_model.dart';
import 'package:sirnawa_mobile/data/services/api/user_fcm_token_service.dart';

class FCMService {
  final FirebaseMessaging _firebaseMessaging;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  final UserFcmTokenService _userFcmTokenService;
  final DeviceInfoPlugin _deviceInfoPlugin;
  final PackageInfo _packageInfo;

  FCMService(
    this._firebaseMessaging,
    this._flutterLocalNotificationsPlugin,
    this._userFcmTokenService,
    this._deviceInfoPlugin,
    this._packageInfo,
  );

  Future<void> initialize() async {
    await _setupNotificationPermissions();
    await _setupForegroundMessageHandling();
    await _setupBackgroundMessageHandling();
    await _setupLocalNotifications();
    await _getToken();
    _setupInteractedMessage();
  }

  Future<void> _setupNotificationPermissions() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('User granted permission');
    } else {
      debugPrint('User declined or has not accepted permission');
    }
  }

  Future<void> _setupForegroundMessageHandling() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showNotification(message);
      // Tambahkan logika penanganan pesan sesuai kebutuhan
    });
  }

  Future<void> _setupBackgroundMessageHandling() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> _setupLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings
    initializationSettingsDarwin = DarwinInitializationSettings(
      //TODO: onDidReceiveLocalNotification: (id, title, body, payload) async {},
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsDarwin,
        );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        // Handle ketika notifikasi diklik
      },
    );
  }

  Future<Map<String, dynamic>> _getDeviceData() async {
    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfoPlugin.androidInfo;
      return {
        'device_id': androidInfo.id,
        'os_version': 'Android ${androidInfo.version.release}',
        'platform': 'android',
      };
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfoPlugin.iosInfo;
      return {
        'device_id': iosInfo.identifierForVendor ?? 'unknown',
        'os_version': 'iOS ${iosInfo.systemVersion}',
        'platform': 'ios',
      };
    } else if (Platform.isWindows) {
      final windowsInfo = await _deviceInfoPlugin.windowsInfo;
      return {
        'device_id': windowsInfo.deviceId,
        'os_version': 'Windows ${windowsInfo.computerName}',
        'platform': 'windows',
      };
    }
    return {
      'device_id': 'unknown',
      'os_version': 'unknown',
      'platform': Platform.operatingSystem,
    };
  }

  Future<void> _getToken() async {
    try {
      String? token = await _firebaseMessaging.getToken();
      if (token != null) {
        debugPrint('FCM Token: $token');
        // Kirim token ke server Anda untuk disimpan
        await _sendTokenToServer(token);
      }
    } catch (e) {
      debugPrint('Error getting FCM token: $e');
    }

    // Handle token refresh
    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      debugPrint('New FCM Token: $newToken');
      _sendTokenToServer(newToken);
    });
  }

  Future<void> _sendTokenToServer(String token) async {
    try {
      final deviceData = await _getDeviceData();
      // Anda perlu menambahkan properti lain yang diperlukan untuk model
      final request = UserFcmTokenRequestModel(
        token: token,
        deviceType: Platform.operatingSystem,
        apVersion: _packageInfo.version,
        deviceId:
            deviceData['device_id'] ?? 'unknown', // Ambil dari device_info_plus
        osVersion:
            deviceData['os-version'] ??
            'unknown', // Ambil dari device_info_plus
      );

      await _userFcmTokenService.createUserFcmToken(request);
    } catch (e) {
      debugPrint('Error sending token to server: $e');
    }
  }

  Future<void> removeToken(String token) async {
    try {
      await _userFcmTokenService.deleteUserFcmToken(token);
    } catch (e) {
      debugPrint('Error removing token from server: $e');
    }
  }

  void _setupInteractedMessage() {
    // Handle ketika aplikasi dibuka dari notifikasi yang diklik
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        _handleMessage(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    // Navigasi ke halaman tertentu berdasarkan data notifikasi
    // Contoh:
    // if (message.data['type'] == 'chat') {
    //   Navigator.push(context, ChatPageRoute(id: message.data['id']));
    // }
  }

  Future<void> showLocalNotification({
    required String title,
    required String body,
  }) async {
    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          'your_channel_id',
          'Your Channel Name',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
    );
  }

  Future<void> _showNotification(RemoteMessage message) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'your_channel_id',
          'Your Channel Name',
          channelDescription: 'Your Channel Description',
          importance: Importance.max,
          priority: Priority.high,
          showWhen: false,
        );

    DarwinNotificationDetails iosPlatformChannelSpecifics =
        DarwinNotificationDetails();

    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosPlatformChannelSpecifics,
    );

    await _flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      platformChannelSpecifics,
      payload: jsonEncode(message.data),
    );
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // Tambahkan logika penanganan pesan latar belakang di sini
  // Contoh: menampilkan notifikasi
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  final DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings();

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
        'your_channel_id',
        'Your Channel Name',
        channelDescription: 'Your Channel Description',
        importance: Importance.max,
        priority: Priority.high,
        showWhen: false,
      );

  DarwinNotificationDetails iosPlatformChannelSpecifics =
      DarwinNotificationDetails();

  NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iosPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    message.notification?.title,
    message.notification?.body,
    platformChannelSpecifics,
    payload: jsonEncode(message.data),
  );
}
