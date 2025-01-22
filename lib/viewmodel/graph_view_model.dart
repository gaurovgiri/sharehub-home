import 'package:get/get.dart';
import 'package:sharehub_home/model/graph_model.dart';
import 'package:sharehub_home/repo/graph_repo.dart';

class GraphViewModel extends GetxController {
  var isLoading = false.obs;
  var graphData = <GraphModel>[].obs;
  var selectedTimeFrame = "1D".obs;

  final GraphRepo _graphRepo = GraphRepo();

  @override
  void onInit() {
    fetchGraphData();
    super.onInit();
  }

  void fetchGraphData() async {
    isLoading.value = true;
    var data = await _graphRepo.fetchData();
    if (data.isNotEmpty) {
      graphData.value = data;
    }
    isLoading.value = false;
  }
}
