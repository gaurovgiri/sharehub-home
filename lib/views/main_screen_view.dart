import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodel/main_screen_view_model.dart';

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final MainScreenViewModel homeViewModel = Get.put(MainScreenViewModel());

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Share Hub",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Buy Subscription",
                  style: TextStyle(color: Colors.black),
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
