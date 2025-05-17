import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class CrashlyticsService {
  static Future<void> initialize() async {
    try {
      // Pastikan Firebase diinisialisasi dulu
      await Firebase.initializeApp();

      // Tunggu inisialisasi Crashlytics
      await Future.delayed(const Duration(seconds: 1));

      // Set collection enabled HANYA setelah Firebase terinisialisasi
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
        !kDebugMode,
      );

      // Setup error handlers
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };
    } catch (e, stack) {
      // Fallback jika Crashlytics gagal diinisialisasi
      debugPrint('Error initializing Crashlytics: $e\n$stack');
    }
  }

  static void recordError(
    dynamic error,
    StackTrace stack, {
    bool fatal = false,
  }) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: fatal);
  }

  static void log(String message) {
    FirebaseCrashlytics.instance.log(message);
  }

  static void setUserIdentifier(String userId) {
    FirebaseCrashlytics.instance.setUserIdentifier(userId);
  }
}
