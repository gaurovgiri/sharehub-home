import 'dart:async';

import 'package:get/get.dart';
import 'package:sharehub_home/model/market_model.dart';
import 'package:sharehub_home/repo/market_repo.dart';
import 'package:get_storage/get_storage.dart';

class MarketDashboardViewModel extends GetxController {
  final MarketRepository _marketRepository = MarketRepository();
  var marketData = MarketModel().obs;
  var isLoading = false.obs;
  var selectedCategory = "Top Gainers".obs;
  var dashboardTwoData = MarketModel().obs;
  var selectedCategoryTwo = "Top Turnover".obs;
  final box = GetStorage();

  @override
  void onInit() {
    readLocalMarketData();
    fetchMarketData();
    super.onInit();
    // Fetch data every 10 seconds
    ever(marketData, (_) => storeMarketData());
    fetchMarketDataPeriodically();
  }

  void readLocalMarketData() {
    var localData = box.read('marketData');
    if (localData != null) {
      print('Local market data found: $localData');
      marketData.value = MarketModel.fromJson(localData);
    } else {
      print('No local market data found');
    }
  }

  void fetchMarketData() async {
    isLoading.value = true;
    var data = await _marketRepository.fetch();
    if (data != null) {
      marketData.value = data;
    }
    isLoading.value = false;
  }

  void fetchMarketDataPeriodically() {
    fetchMarketData(); // Initial fetch
    Timer.periodic(Duration(seconds: 10), (timer) {
      fetchMarketData();
    });
  }

  void storeMarketData() {
    var dataToStore = marketData.toJson();
    print('Storing market data: $dataToStore');
    box.write('marketData', dataToStore);
  }

  void updateData(String category) {
    selectedCategory.value = category;
  }

  void updateDataTwo(String category) {
    selectedCategoryTwo.value = category;
  }
}
