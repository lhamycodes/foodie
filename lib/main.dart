import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'const.dart';
import 'locator.dart';
import 'routes.dart';
import 'services/navigation_service.dart';
import 'ui/views/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      builder: BotToastInit(),
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<MyNavigationService>().navigationKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: appRoutes,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const SplashScreen());
      },
      navigatorObservers: [
        BotToastNavigatorObserver(),
      ],
    );
  }
}
