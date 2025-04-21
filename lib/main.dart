import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:sirnawa_mobile/config/depedencies.dart';
import 'package:sirnawa_mobile/routing/router.dart';
import 'package:sirnawa_mobile/ui/core/ui/scroll_behaviour.dart';
import 'package:sirnawa_mobile/utils/theme.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      title: 'Sirnajaya Kartika Warga',
      scrollBehavior: AppCustomScrollBehavior(),
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      routerConfig: router(context.read()),
    );
  }
}
