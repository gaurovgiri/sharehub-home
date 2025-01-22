import 'package:flutter/material.dart';
import 'package:sharehub_home/views/widgets/floating_nav.dart';
import 'package:sharehub_home/views/widgets/graph.dart';
import 'package:sharehub_home/views/widgets/profile_card.dart';
import 'package:sharehub_home/views/widgets/watch_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileCard(),
            FloatingNav(),
            SizedBox(height: 450, child: GraphWidget()),
            // WatchList()
          ],
        ),
      ),
    );
  }
}
