import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logging/logging.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/config/fcm_providers.dart';
import 'package:sirnawa_mobile/config/notification_providers.dart';
import 'package:sirnawa_mobile/data/services/firebase_crashlytic.dart';
import 'package:sirnawa_mobile/data/services/share_preference_service.dart';
import 'package:sirnawa_mobile/routing/router_v3.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/core/themes/theme.dart';
import 'package:sirnawa_mobile/ui/core/ui/scroll_behaviour.dart';
import 'package:sirnawa_mobile/utils/util.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CrashlyticsService.initialize();
  Logger("Starting application");
  Logger.root.level = Level.ALL;
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesServiceProvider.overrideWithValue(
          SharedPreferencesService(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    _setupFcmListeners(context, ref);
    // final brightness = MediaQuery.of(context).platformBrightness;
    TextTheme textTheme = createTextTheme(
      context,
      "Merriweather Sans",
      "Plus Jakarta Sans",
    );
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp.router(
      locale: const Locale('id', 'ID'),
      supportedLocales: const [Locale('id', 'ID')],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      debugShowCheckedModeBanner: false,
      title: 'Sirnajaya Kartika Warga',
      scrollBehavior: AppCustomScrollBehavior(),
      theme:
          theme
              .light(), //brightness == Brightness.light ? theme.light() : theme.dark(),
      routerConfig: router,
    );
  }

  void _setupFcmListeners(BuildContext context, WidgetRef ref) {
    // Pastikan hanya di-setup sekali
    if (_isFcmInitialized) return;
    _isFcmInitialized = true;

    // Listener untuk notifikasi foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      ref
          .read(fcmServiceProvider)
          .when(
            data: (fcmService) {
              fcmService.showLocalNotification(
                title: message.notification?.title ?? 'Notifikasi Baru',
                body: message.notification?.body ?? '',
              );

              ref.read(notificationsProvider.notifier).fetchNotifications();
              final _ = ref.refresh(unreadCountProvider);
            },
            loading: () {
              // Handle loading state jika diperlukan
              debugPrint('FCMService sedang loading');
            },
            error: (error, stack) {
              // Handle error state
              debugPrint('Error FCMService: $error');
            },
          );

      ref.read(notificationsProvider.notifier).fetchNotifications();
      final _ = ref.refresh(unreadCountProvider);
    });

    // Listener ketika notifikasi diklik (app dibuka dari terminated state)
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.push(Routes.notifications);
        });
      }
    });

    // Listener ketika notifikasi diklik (app di background)
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      context.push(Routes.notifications);
    });
  }

  static bool _isFcmInitialized = false;
}
