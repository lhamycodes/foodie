import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'const.dart';
import 'locator.dart';
import 'routes.dart';
import 'services/navigation_service.dart';
import 'ui/shared/app_colors.dart';
import 'ui/views/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await setupLocator();
    runApp(const MyApp());
  } catch (error) {
    debugPrint(error.toString());
    debugPrint('Locator setup has failed');
  }
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
        fontFamily: "Gilroy",
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.orange,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: scaffoldBgColor,
        hintColor: primaryColor,
        indicatorColor: primaryColor,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
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
