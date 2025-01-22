import 'package:flutter/material.dart';
import 'package:sharehub_home/views/widgets/floating_nav.dart';
import 'package:sharehub_home/views/widgets/graph.dart';
import 'package:sharehub_home/views/widgets/profile_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileCard(),
          FloatingNav(),
          SizedBox(height: 500, child: GraphWidget())
        ],
      ),
    );
  }
}
