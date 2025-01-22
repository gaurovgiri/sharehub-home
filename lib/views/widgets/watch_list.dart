import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sharehub_home/model/graph_model.dart';
import 'package:sharehub_home/viewmodel/graph_view_model.dart';
import 'package:sharehub_home/viewmodel/market_dashboard_view_model.dart';

class WatchList extends StatelessWidget {
  WatchList({super.key}) {
    Get.put(MarketDashboardViewModel());
    Get.put(GraphViewModel());
  }

  final market = Get.find<MarketDashboardViewModel>();
  final graphData = Get.find<GraphViewModel>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var data = graphData.graphData;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.grey.shade300, width: 1)),
          height: 320,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Card(
            margin: EdgeInsets.zero,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              side: BorderSide(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Watch List',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  CarouselSlider.builder(
                    itemCount: market.marketData.value.topGainers?.length ?? 0,
                    itemBuilder: (context, index, realIndex) {
                      var topGainer =
                          market.marketData.value.topGainers![index];
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 4,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.network(
                                    "https://cdn.arthakendra.com/${topGainer.icon!}",
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) => Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            topGainer.symbol ?? "",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            "${topGainer.changePercent.toString()}%",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      SizedBox(
                                        width: 190,
                                        child: Text(
                                          topGainer.name ?? "",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                height: 90,
                                width: double.infinity,
                                child: LineChart(
                                  LineChartData(
                                    titlesData: FlTitlesData(
                                      show: true,
                                      leftTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false),
                                      ),
                                      topTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false),
                                      ),
                                      bottomTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                          reservedSize: 20,
                                          interval:
                                              (data.length / 5).ceilToDouble(),
                                          getTitlesWidget: (value, meta) {
                                            if (value.toInt() >= data.length ||
                                                value.toInt() < 0) {
                                              return const SizedBox.shrink();
                                            }
                                            String format;
                                            switch (graphData
                                                .selectedTimeFrame.value) {
                                              case '1W':
                                                format = 'EEE';
                                                break;
                                              case '1M':
                                              case '2M':
                                                format = 'MMM';
                                                break;
                                              case '1Y':
                                                format = 'MMM';
                                                break;
                                              default:
                                                format = 'HH:mm';
                                            }
                                            return Text(
                                              DateFormat(format).format(
                                                  data[value.toInt()].time),
                                              style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      rightTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false),
                                      ),
                                    ),
                                    borderData: FlBorderData(
                                      show: true,
                                      border: Border.all(
                                        color: Colors.grey.shade200,
                                      ),
                                    ),
                                    minX: 0,
                                    maxX: data.length.toDouble() - 1,
                                    minY: _getMinY(data),
                                    maxY: _getMaxY(data),
                                    lineBarsData: [
                                      LineChartBarData(
                                        spots: _createSpots(data),
                                        isCurved: true,
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.green.withOpacity(0.8),
                                            Colors.green.withOpacity(0.3),
                                          ],
                                        ),
                                        barWidth: 2,
                                        isStrokeCapRound: true,
                                        dotData: FlDotData(show: false),
                                        belowBarData: BarAreaData(
                                          show: true,
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.green.withOpacity(0.2),
                                              Colors.green.withOpacity(0.0),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Change: ${topGainer.change.toString()}',
                                    style: TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'LTP: ${topGainer.lastTradedPrice.toString()}',
                                    style: TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 240,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.85,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  double _getMinY(List<GraphModel> data) {
    if (data.isEmpty) return 0;
    return data.map((e) => e.value).reduce((a, b) => a < b ? a : b) - 5;
  }

  double _getMaxY(List<GraphModel> data) {
    if (data.isEmpty) return 0;
    return data.map((e) => e.value).reduce((a, b) => a > b ? a : b) + 5;
  }

  List<FlSpot> _createSpots(List<GraphModel> data) {
    return List.generate(
      data.length,
      (index) => FlSpot(index.toDouble(), data[index].value),
    );
  }
}
