import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharehub_home/viewmodel/theme_view_model.dart';
import 'package:sharehub_home/resources/app_theme.dart';
import '../viewmodel/main_screen_view_model.dart';

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final MainScreenViewModel homeViewModel = Get.put(MainScreenViewModel());
    final themeViewModel = Get.find<ThemeViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Share Hub",
              style: TextStyle(color: AppTheme.textAccentColor),
            )
          ],
        ),
        actions: [
          Obx(() => IconButton(
              onPressed: themeViewModel.toggleTheme,
              icon: Icon(
                  themeViewModel.isDarkMode.value
                      ? Icons.wb_sunny
                      : Icons.dark_mode,
                  color: AppTheme.textAccentColor))),
          TextButton(
              onPressed: () {},
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Buy Subscription",
                  style: TextStyle(color: AppTheme.textColor),
                ),
              ))
        ],
      ),
      body: Obx(() => homeViewModel.pages[homeViewModel.selectedIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: homeViewModel.selectedIndex.value,
            type: BottomNavigationBarType.fixed,
            onTap: homeViewModel.onItemTapped,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Watchlist'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: 'Services'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          )),
    );
  }
}
