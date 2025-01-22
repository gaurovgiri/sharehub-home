import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primarySwatch: MaterialColor(
      0xFF0B3132,
      <int, Color>{
        50: Color(0xFFE1E7E7),
        100: Color(0xFFB3C2C2),
        200: Color(0xFF809999),
        300: Color(0xFF4D7070),
        400: Color(0xFF264F4F),
        500: Color(0xFF0B3132),
        600: Color(0xFF0A2C2D),
        700: Color(0xFF082626),
        800: Color(0xFF061F20),
        900: Color(0xFF041414),
      },
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Color(0xFF0B3132),
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.grey[900],
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
