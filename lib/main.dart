import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharehub_home/viewmodel/graph_view_model.dart';
import 'package:sharehub_home/viewmodel/market_dashboard_view_model.dart';
import 'package:sharehub_home/viewmodel/theme_view_model.dart';
import 'package:sharehub_home/views/splash_screen.dart';
import 'package:sharehub_home/views/main_screen_view.dart';

void main() {
  Get.put(GraphViewModel(), permanent: true);
  Get.put(MarketDashboardViewModel(), permanent: true);
  runApp(ShareHub());
}

class ShareHub extends StatelessWidget {
  ShareHub({super.key});

  final ThemeViewModel _theme = Get.put(ThemeViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          title: "Share Hub",
          theme: _theme.currentTheme,
          initialRoute: '/splash',
          getPages: [
            GetPage(name: '/splash', page: () => const SplashScreen()),
            GetPage(name: '/home', page: () => const MainScreenView()),
          ],
        ));
  }
}
