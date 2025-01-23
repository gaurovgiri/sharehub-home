import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF0B3132);
  static const secondaryColor = Colors.white;
  static const accentColor = Colors.blueAccent;
  static const borderColor = Colors.grey;
  static const shadowColor = Colors.grey;
  static const textColor = Colors.black;
  static const textSecondaryColor = Colors.grey;
  static const textAccentColor = Colors.white;
  static const textHighlightColor = Colors.green;
  static const textErrorColor = Colors.red;

  static final lightTheme = ThemeData(
    primarySwatch: MaterialColor(
      primaryColor.value,
      <int, Color>{
        50: Color(0xFFE1E7E7),
        100: Color(0xFFB3C2C2),
        200: Color(0xFF809999),
        300: Color(0xFF4D7070),
        400: Color(0xFF264F4F),
        500: primaryColor,
        600: Color(0xFF0A2C2D),
        700: Color(0xFF082626),
        800: Color(0xFF061F20),
        900: Color(0xFF041414),
      },
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: secondaryColor,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: textColor),
      bodyMedium: TextStyle(color: textColor),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: primaryColor,
      iconTheme: IconThemeData(color: textColor),
      titleTextStyle: TextStyle(
        color: textColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardColor: Colors.white,
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.grey[900],
      titleTextStyle: TextStyle(
        color: textAccentColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardColor: Color(0xFF1B1D22),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: textAccentColor),
      bodyMedium: TextStyle(color: textSecondaryColor),
    ),
  );
}
