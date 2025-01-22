import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharehub_home/viewmodel/market_dashboard_view_model.dart';

class WatchList extends StatelessWidget {
  WatchList({super.key}) {
    Get.put(MarketDashboardViewModel());
  }

  final market = Get.find<MarketDashboardViewModel>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
          height: 300,
          width: MediaQuery.sizeOf(context).width * 0.9,
          child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                  style: BorderStyle.solid,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Watch List',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    CarouselSlider(items: [
                      for (var i = 0;
                          i < market.marketData.value.topGainers!.length;
                          i++)
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Text(market
                                      .marketData.value.topGainers![i].symbol ??
                                  ""),
                              Text(
                                  market.marketData.value.topGainers![i].name ??
                                      ""),
                              Text(market
                                  .marketData.value.topGainers![i].changePercent
                                  .toString()),
                              Text(market.marketData.value.topGainers![i].change
                                  .toString()),
                            ],
                          ),
                        )
                    ], options: CarouselOptions(height: 250)),
                  ],
                ),
              )));
    });
  }
}
