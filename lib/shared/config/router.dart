import 'package:flutter/material.dart';

import '../../screens/splash/splash_layout.dart';

class AppRouter {
  static Map<String, Widget Function(dynamic)> router() {
    return {
      '/': (ctx) => const SplashScreen(),
      SplashScreen.routeName: (ctx) => const SplashScreen(),
    };
  }
}
