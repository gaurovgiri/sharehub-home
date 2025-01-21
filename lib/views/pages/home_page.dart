import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharehub_home/viewmodel/theme_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeViewModel themeViewModel = Get.find<ThemeViewModel>();

    return Center(
      child: TextButton(
        onPressed: () {
          themeViewModel.toggleTheme();
        },
        child: const Text("Toggle Mode"),
      ),
    );
  }
}
