import 'package:fast_foodie/screens/favourite/favourite_layout.dart';
import 'package:fast_foodie/screens/home/home_layout.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Map<String, Widget Function(dynamic)> router() {
    return {
      '/': (ctx) => const HomeScreen(),
      HomeScreen.routeName: (ctx) => const HomeScreen(),
      FavouriteScreen.routeName: (ctx) => const FavouriteScreen(),
    };
  }
}
