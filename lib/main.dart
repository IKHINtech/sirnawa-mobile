import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/services/share_preference_service.dart';
import 'package:sirnawa_mobile/routing/router_v3.dart';
import 'package:sirnawa_mobile/ui/core/themes/theme.dart';
import 'package:sirnawa_mobile/ui/core/ui/scroll_behaviour.dart';
import 'package:sirnawa_mobile/utils/util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load();
  } catch (e) {
    Logger("Starting application error");
  }
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
    final brightness = MediaQuery.of(context).platformBrightness;
    TextTheme textTheme = createTextTheme(
      context,
      "Merriweather Sans",
      "Plus Jakarta Sans",
    );
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Sirnajaya Kartika Warga',
      scrollBehavior: AppCustomScrollBehavior(),
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      routerConfig: router,
    );
  }
}
