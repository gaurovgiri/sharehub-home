import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sharehub_home/model/graph_model.dart';
import 'package:sharehub_home/viewmodel/graph_view_model.dart';
import 'package:sharehub_home/viewmodel/market_dashboard_view_model.dart';
import 'package:sharehub_home/views/widgets/labels.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GraphWidget extends StatelessWidget {
  GraphWidget({Key? key}) : super(key: key) {
    Get.put(GraphViewModel());
    Get.put(MarketDashboardViewModel());
  }

  final graphData = Get.find<GraphViewModel>();
  final market = Get.find<MarketDashboardViewModel>();
  final ScrollController scrollController = ScrollController();
  var previous = "1D";

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final data = graphData.graphData;
      if (data.isEmpty) {
        return const Center(child: Text('No data available'));
      }

      return LayoutBuilder(
        builder: (context, constraints) {
          final availableHeight = constraints.maxHeight;
          final availableWidth = constraints.maxWidth;

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            width: availableWidth * 0.9,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              margin: const EdgeInsets.all(0),
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DropdownButton<String>(
                                dropdownColor: Colors.white,
                                value: graphData.selectedValue.value,
                                items: market.marketData.value.indices
                                    ?.map((index) {
                                  return DropdownMenuItem(
                                    value: index.name,
                                    child: Text(index.name ?? ''),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    graphData.updateSelectedValue(value);
                                  }
                                },
                                underline: SizedBox(),
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_right_alt),
                                iconSize: 40,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: availableWidth * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Labels(
                                    label: '',
                                    value: market.marketData.value.indices?[0]
                                        .currentValue
                                        .toString(),
                                    colors: Colors.green,
                                  ),
                                  SizedBox(width: 10),
                                  Labels(
                                    label: '',
                                    value: market
                                        .marketData.value.indices?[0].change
                                        .toString(),
                                    colors: Colors.green,
                                  ),
                                  SizedBox(width: 10),
                                  Labels(
                                    label: '',
                                    value:
                                        "${market.marketData.value.indices?[0].changePercent.toString()}%",
                                    colors: Colors.green,
                                  ),
                                ],
                              ),
                              Labels(
                                label: "",
                                value:
                                    "Market ${market.marketData.value.marketStatus?.status}",
                                colors: Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  SizedBox(
                    width: availableWidth * 0.85,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Labels(
                              label: 'Advanced',
                              value: market
                                  .marketData.value.stockSummary?.advanced
                                  .toString(),
                              colors: Colors.green,
                            ),
                            SizedBox(width: 5),
                            Labels(
                              label: 'Declined',
                              value: market
                                  .marketData.value.stockSummary?.declined
                                  .toString(),
                              colors: Colors.red,
                            ),
                            SizedBox(width: 5),
                            Labels(
                              label: 'Unchanged',
                              value: market
                                  .marketData.value.stockSummary?.unchanged
                                  .toString(),
                              colors: Colors.blue,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Labels(
                              label: '+ve Circuit',
                              value: market.marketData.value.stockSummary
                                  ?.positiveCircuit
                                  .toString(),
                              colors: Colors.green,
                            ),
                            SizedBox(width: 5),
                            Labels(
                              label: '-ve Circuit',
                              value: market.marketData.value.stockSummary
                                  ?.negativeCircuit
                                  .toString(),
                              colors: Colors.red,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: availableHeight * 0.5,
                    width: availableWidth * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: LineChart(
                        LineChartData(
                          titlesData: FlTitlesData(
                            show: true,
                            leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                              showTitles: false,
                            )),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                maxIncluded: false,
                                reservedSize: 20,
                                interval: (data.length / 5).ceilToDouble(),
                                getTitlesWidget: (value, meta) {
                                  if (value.toInt() >= data.length ||
                                      value.toInt() < 0) {
                                    return const SizedBox.shrink();
                                  }
                                  String format;
                                  switch (graphData.selectedTimeFrame.value) {
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
                                    DateFormat(format)
                                        .format(data[value.toInt()].time),
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            ),
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(
                                maxIncluded: false,
                                showTitles: true,
                                minIncluded: false,
                                reservedSize: 50,
                                interval: (_getMaxY(data) - _getMinY(data)) /
                                    5, // Larger intervals
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toStringAsFixed(2),
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          borderData: FlBorderData(
                            show: true,
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.2)),
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
                              isStrokeJoinRound: true,
                              curveSmoothness: 0.2,
                            ),
                          ],
                          lineTouchData: LineTouchData(
                            enabled: true,
                            touchTooltipData: LineTouchTooltipData(
                              getTooltipItems:
                                  (List<LineBarSpot> touchedSpots) {
                                return touchedSpots
                                    .map((LineBarSpot touchedSpot) {
                                  return LineTooltipItem(
                                    '${data[touchedSpot.x.toInt()].value.toStringAsFixed(2)}\n${DateFormat('HH:mm').format(data[touchedSpot.x.toInt()].time)}',
                                    const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  );
                                }).toList();
                              },
                            ),
                            touchCallback: (FlTouchEvent event,
                                LineTouchResponse? response) {
                              if (response == null ||
                                  response.lineBarSpots == null) {
                                return;
                              }
                              final value = response.lineBarSpots!.first.y;
                              final index =
                                  response.lineBarSpots!.first.x.toInt();
                              final time = data[index].time;
                              // Handle touch event
                            },
                          ),
                          // Add animation
                          showingTooltipIndicators: [],
                        ),
                        duration: Duration(
                            milliseconds: 1000), // Add animation duration
                        curve: Curves.easeInOut, // Add animation curve
                      ),
                    ),
                  ),
                  Container(
                    width: availableWidth * 0.85,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: ['1D', '1W', '1M', '3M', '1Y'].map((label) {
                            return Obx(() {
                              final isSelected =
                                  graphData.selectedTimeFrame.value == label;
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: isSelected ? 5 : 0,
                                  foregroundColor: Colors.white,
                                  backgroundColor: isSelected
                                      ? Color(0xFF0B3132)
                                      : Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  graphData.updateSelectedTimeFrame(label);
                                  if (label == "1D") {
                                    scrollController.animateTo(
                                      scrollController.position.minScrollExtent,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                  if (label == "1Y") {
                                    scrollController.animateTo(
                                      scrollController.position.maxScrollExtent,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                  previous = label;
                                },
                                child: Text(
                                  label,
                                  style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.grey),
                                ),
                              );
                            });
                          }).toList(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
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
