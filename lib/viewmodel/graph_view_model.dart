import 'package:get/get.dart';
import 'package:sharehub_home/model/graph_model.dart';
import 'package:sharehub_home/repo/graph_repo.dart';

class GraphViewModel extends GetxController {
  var isLoading = false.obs;
  var graphData = <GraphModel>[].obs;
  var selectedTimeFrame = "1D".obs;
  var selectedValue = "NEPSE".obs;

  final GraphRepo _graphRepo = GraphRepo();

  @override
  void onInit() {
    fetchGraphData();
    super.onInit();
  }

  void fetchGraphData() async {
    isLoading.value = true;
    var data = await _graphRepo.fetchData(selectedValue.value);
    if (data.isNotEmpty) {
      graphData.value = data;
    }
    isLoading.value = false;
  }

  Future<void> fetchGraphDataForTimeFrame() async {
    isLoading.value = true;
    var data = await _graphRepo.fetchDataForTimeFrame(
        selectedTimeFrame.value, selectedValue.value);
    if (data.isNotEmpty) {
      graphData.value = data;
    }
    isLoading.value = false;
  }

  void updateSelectedValue(String value) {
    selectedValue.value = value;
    if (selectedTimeFrame.value == "1D") {
      fetchGraphData();
    } else {
      fetchGraphDataForTimeFrame();
    }
  }

  void updateSelectedTimeFrame(String timeFrame) {
    selectedTimeFrame.value = timeFrame;
    if (timeFrame == "1D") {
      fetchGraphData();
    } else {
      fetchGraphDataForTimeFrame();
    }
  }
}
