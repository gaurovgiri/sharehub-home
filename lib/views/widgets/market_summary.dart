import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharehub_home/viewmodel/market_dashboard_view_model.dart';
import 'package:sharehub_home/resources/app_theme.dart';

class MarketSummary extends StatelessWidget {
  const MarketSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final market = Get.find<MarketDashboardViewModel>();
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppTheme.borderColor.shade300, width: 1),
        ),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Market Summary',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Obx(() {
                  final marketSummary = market.marketData.value.marketSummary;
                  return Table(
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(1),
                    },
                    children: marketSummary!.map((item) {
                      return TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item.name ?? 'N/A',
                            style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text("${item.value}",
                                style: theme.textTheme.bodyMedium),
                          ),
                        ),
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
