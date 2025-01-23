import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sharehub_home/views/widgets/floating_nav.dart';
import 'package:sharehub_home/views/widgets/graph.dart';
import 'package:sharehub_home/views/widgets/market_dashboard.dart';
import 'package:sharehub_home/views/widgets/market_dashboard_two.dart';
import 'package:sharehub_home/views/widgets/market_summary.dart';
import 'package:sharehub_home/views/widgets/profile_card.dart';
import 'package:sharehub_home/views/widgets/watch_list.dart';
import 'package:sharehub_home/viewmodel/main_screen_view_model.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  MainScreenViewModel get mainScreenController =>
      Get.find<MainScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: mainScreenController.refreshData,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ProfileCard(),
            ),
            SliverPersistentHeader(
              pinned: true, // Makes the header stick to the top
              delegate: FloatingNavHeaderDelegate(),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 425, child: GraphWidget()),
                  WatchList(),
                  MarketDashBoard(),
                  MarketDashBoardTwo(),
                  MarketSummary(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FloatingNavHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: maxExtent,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: FloatingNav(),
      ),
    );
  }

  @override
  double get maxExtent => 60;
  @override
  double get minExtent => 60;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
