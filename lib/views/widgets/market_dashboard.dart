import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharehub_home/viewmodel/market_dashboard_view_model.dart';
import 'package:sharehub_home/resources/app_theme.dart';

class MarketDashBoard extends StatelessWidget {
  const MarketDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final market = Get.find<MarketDashboardViewModel>();
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppTheme.borderColor.shade300, width: 1),
        ),
        height: 400,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Card(
          margin: EdgeInsets.zero,
          color: theme.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(
              color: AppTheme.borderColor.shade300,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: ['Top Gainers', 'Top Losers'].map((label) {
                      return Obx(() {
                        final isSelected =
                            market.selectedCategory.value == label;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: isSelected ? 5 : 0,
                              foregroundColor: Colors.white,
                              backgroundColor: isSelected
                                  ? AppTheme.primaryColor
                                  : Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              market.updateData(label);
                            },
                            child: Text(
                              label,
                              style: TextStyle(
                                color: isSelected
                                    ? AppTheme.textAccentColor
                                    : AppTheme.textSecondaryColor,
                              ),
                            ),
                          ),
                        );
                      });
                    }).toList(),
                  ),
                ),
                SizedBox(height: 16),
                Obx(() {
                  final selectedCategory = market.selectedCategory.value;
                  final data = selectedCategory == 'Top Gainers'
                      ? market.marketData.value.topGainers
                      : market.marketData.value.topLosers;
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
                      final isPositive = itemData.change > 0;
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
                            Text(
                              itemData.symbol.length > 5
                                  ? '${itemData.symbol.substring(0, 5)}...'
                                  : itemData.symbol,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )),
                        DataCell(Text(
                          itemData.change.toString(),
                          style: TextStyle(
                            color: isPositive
                                ? AppTheme.textHighlightColor
                                : AppTheme.textErrorColor,
                          ),
                        )),
                        DataCell(Text(
                          '${itemData.changePercent}%',
                          style: TextStyle(
                            color: isPositive
                                ? AppTheme.textHighlightColor
                                : AppTheme.textErrorColor,
                          ),
                        )),
                        DataCell(Text(itemData.lastTradedPrice.toString(),
                            style: theme.textTheme.bodyMedium)),
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
