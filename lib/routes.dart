import 'package:flutter/material.dart';

import 'ui/views/cart.dart';
import 'ui/views/payment.dart';
import 'ui/views/splash.dart';
import 'ui/views/track.dart';

var appRoutes = <String, WidgetBuilder>{
  // Intro
  '/': (ctx) => const SplashScreen(),
  // App routes
  CartScreen.routeName: (ctx) => const CartScreen(),
  PaymentScreen.routeName: (ctx) => const PaymentScreen(),
  TrackOrderScreen.routeName: (ctx) => const TrackOrderScreen(),
};
