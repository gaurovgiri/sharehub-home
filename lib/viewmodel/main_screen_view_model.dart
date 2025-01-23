import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/pages/home_page.dart';
import 'market_dashboard_view_model.dart';
import 'graph_view_model.dart';

class MainScreenViewModel extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    const HomePage(),
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  Future<void> refreshData() async {
    Get.find<MarketDashboardViewModel>().fetchMarketData();
    Get.find<GraphViewModel>().fetchGraphData();
  }
}
