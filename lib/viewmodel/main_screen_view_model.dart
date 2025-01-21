import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/pages/home_page.dart';

class MainScreenViewModel extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    const HomePage(),
    // Add other pages here
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
