import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharehub_home/resources/app_theme.dart';

class ThemeViewModel extends GetxController {
  var isDarkMode = false.obs;

  ThemeData get currentTheme =>
      isDarkMode.value ? AppTheme.darkTheme : AppTheme.lightTheme;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }
}
