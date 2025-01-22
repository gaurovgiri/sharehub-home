import 'dart:async';

import 'package:get/get.dart';
import 'package:sharehub_home/model/graph_model.dart';
import 'package:sharehub_home/repo/graph_repo.dart';
import 'package:get_storage/get_storage.dart';

class GraphViewModel extends GetxController {
  var isLoading = false.obs;
  var graphData = <GraphModel>[].obs;
  var selectedTimeFrame = "1D".obs;
  var selectedValue = "NEPSE".obs;
  final box = GetStorage();

  final GraphRepo _graphRepo = GraphRepo();

  @override
  void onInit() {
    readLocalGraphData();
    fetchGraphData();
    super.onInit();
    // Fetch data every 10 seconds
    ever(graphData, (_) => storeGraphData());
    fetchGraphDataPeriodically();
  }

  void readLocalGraphData() {
    var localData = box.read('graphData');
    if (localData != null && localData is List) {
      print('Local graph data found: $localData');
      graphData.value = localData
          .map((e) => GraphModel.fromJson([e["time"], e["value"]], e["type"]))
          .toList();
    } else {
      print('No local graph data found');
    }
  }

  void fetchGraphData() async {
    isLoading.value = true;
    var data = await _graphRepo.fetchData(selectedValue.value);
    if (data.isNotEmpty) {
      graphData.value = data;
    }
    isLoading.value = false;
  }

  void fetchGraphDataPeriodically() {
    fetchGraphData(); // Initial fetch
    Timer.periodic(Duration(seconds: 10), (timer) {
      fetchGraphData();
    });
  }

  void storeGraphData() {
    var dataToStore = graphData.map((e) => e.toJson()).toList();
    print('Storing graph data: $dataToStore');
    box.write('graphData', dataToStore);
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
