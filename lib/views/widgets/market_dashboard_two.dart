import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharehub_home/viewmodel/market_dashboard_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MarketDashBoardTwo extends StatelessWidget {
  const MarketDashBoardTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final market = Get.find<MarketDashboardViewModel>();
    final ScrollController scrollController = ScrollController();
    var previous = "Top Turnover";

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        height: 400,
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
                Center(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        'Top Turnover',
                        'Top Transactions',
                        'Top Traded Shares'
                      ].map((label) {
                        return Obx(() {
                          final isSelected =
                              market.selectedCategoryTwo.value == label;

                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: isSelected ? 5 : 0,
                                foregroundColor: Colors.white,
                                backgroundColor: isSelected
                                    ? Color(0xFF0B3132)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {
                                market.updateDataTwo(label);
                                if (previous == "Top Turnover" &&
                                    label == 'Top Transactions') {
                                  scrollController.animateTo(
                                    scrollController.position.maxScrollExtent,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                }
                                if (previous == "Top Traded Shares" &&
                                    label == 'Top Transactions') {
                                  scrollController.animateTo(
                                    scrollController.position.minScrollExtent,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                }
                                previous = label;
                              },
                              child: Text(
                                label,
                                style: TextStyle(
                                  color:
                                      isSelected ? Colors.white : Colors.grey,
                                ),
                              ),
                            ),
                          );
                        });
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Obx(() {
                  final selectedCategory = market.selectedCategoryTwo.value;
                  final data = selectedCategory == 'Top Turnover'
                      ? market.marketData.value.topTurnover
                      : selectedCategory == 'Top Transactions'
                          ? market.marketData.value.topTransactions
                          : market.marketData.value.topTradedShares;
                  return DataTable(
                    columnSpacing: 30.0,
                    columns: const [
                      DataColumn(label: Text('Symbol')),
                      DataColumn(label: Text('CH')),
                      DataColumn(label: Text('CH %')),
                      DataColumn(label: Text('LTP')),
                    ],
                    rows: data!.take(5).map((item) {
                      final itemData = item as dynamic;
                      return DataRow(cells: [
                        DataCell(Row(
                          children: [
                            Image.network(
                              "https://cdn.arthakendra.com/${itemData.icon}",
                              width: 20,
                              height: 20,
                              errorBuilder: (context, error, stackTrace) {
                                return SizedBox(
                                  width: 20,
                                  height: 20,
                                );
                              },
                            ),
                            SizedBox(width: 5),
                            Text(
                              itemData.symbol.length > 5
                                  ? '${itemData.symbol.substring(0, 5)}...'
                                  : itemData.symbol,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )),
                        DataCell(Text(itemData.change.toString())),
                        DataCell(Text('${itemData.changePercent}%')),
                        DataCell(Text(itemData.lastTradedPrice.toString())),
                      ]);
                    }).toList(),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
