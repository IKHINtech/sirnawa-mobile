import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:sirnawa_mobile/config/depedencies.dart';
import 'package:sirnawa_mobile/routing/router_v2.dart';
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
  runApp(MultiProvider(providers: providersRemote, child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late final GoRouter _router;


@override
  void initState() {
    super.initState();
    _router = createRouter(context);
  }


  @override
  Widget build(BuildContext context) {
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
      routerConfig: _router,
    );
  }
}
