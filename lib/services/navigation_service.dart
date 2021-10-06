import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class MyNavigationService {
  GlobalKey<NavigatorState>? _navigationKey;
  GlobalKey<NavigatorState>? get navigationKey {
    _navigationKey ??= StackedService.navigatorKey;
    return _navigationKey;
  }

  pop({var arg}) {
    return _navigationKey!.currentState!.pop(arg);
  }

  Future<dynamic> navigateTo(
    String routeName, {
    dynamic arguments,
    bool replace = false,
  }) {
    if (replace) {
      return _navigationKey!.currentState!.pushReplacementNamed(
        routeName,
        arguments: arguments,
      );
    }
    return _navigationKey!.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> navigateAndClearRoute(
    String routeName, {
    dynamic arguments,
    String? baseRouteName,
  }) {
    return _navigationKey!.currentState!.pushNamedAndRemoveUntil(
      routeName,
      baseRouteName == null
          ? (Route<dynamic> route) => false
          : ModalRoute.withName(baseRouteName),
      arguments: arguments,
    );
  }
}
