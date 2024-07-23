import 'package:flutter/material.dart';

class AppThemes {
  static const String fontFamily = 'Lato';

  static const Color main = Color(0xFF141416);
  static const Color mainDark = Color.fromARGB(255, 10, 10, 10);
  static const Color mainLight = Color.fromARGB(255, 29, 29, 36);
  static const Color scaffold = Color.fromARGB(255, 255, 255, 255);

  static const Color secondaryLight = Colors.orangeAccent;
  static const Color secondaryDark = Colors.orange;

  static const Color greenLight = Color(0xFF69C275);
  static const Color greenDark = Color(0xFF1D5B26);

  static const Color redLight = Color(0xFFEB2929);
  static const Color redDark = Color(0xFF761515);

  static const Color gray = Color(0xFFA0A0A0);
  static const Color whiteLight = Color(0xFFECECEC);

  static const Color fontMain = Color.fromARGB(255, 0, 0, 0);
  static const Color fontSecondary = Color.fromARGB(255, 123, 154, 119);

  static const List<Color> mainGradient = [mainLight, main];
  static const List<Color> secondaryGradient = [secondaryLight, secondaryDark];

  static lightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: scaffold,
        primaryColor: Colors.orange,
        colorScheme: const ColorScheme.light(primary: Colors.orange),
        appBarTheme: AppBarTheme.of(context).copyWith(
          color: const Color(0xFFFF9A12),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: fontFamily,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
            fontFamily: fontFamily,
            fontSize: 14,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  static darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: fontFamily,
        scaffoldBackgroundColor: scaffold,
        primaryColor: Colors.orange,
        appBarTheme: AppBarTheme.of(context).copyWith(
          color: main,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: fontMain,
            fontFamily: fontFamily,
            fontSize: 14,
          ),
          titleLarge: TextStyle(color: fontSecondary, fontFamily: fontFamily),
          titleMedium: TextStyle(color: fontMain, fontFamily: fontFamily),
          titleSmall: TextStyle(color: fontSecondary, fontFamily: fontFamily),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
