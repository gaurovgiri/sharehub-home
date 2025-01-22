import 'package:get/get.dart';
import 'package:sharehub_home/model/market_model.dart';
import 'package:sharehub_home/repo/market_repo.dart';

class MarketDashboardViewModel extends GetxController {
  final MarketRepository _marketRepository = MarketRepository();
  var marketData = MarketModel().obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchMarketData();
    super.onInit();
  }

  void fetchMarketData() async {
    isLoading.value = true;
    var data = await _marketRepository.fetch();
    if (data != null) {
      marketData.value = data;
    }
    isLoading.value = false;
  }
}
