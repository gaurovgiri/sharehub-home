import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharehub_home/resources/app_theme.dart';
import 'package:get_storage/get_storage.dart';

class ThemeViewModel extends GetxController {
  var isDarkMode = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = box.read('isDarkMode') ?? false;
  }

  ThemeData get currentTheme =>
      isDarkMode.value ? AppTheme.darkTheme : AppTheme.lightTheme;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    box.write('isDarkMode', isDarkMode.value);
  }
}
