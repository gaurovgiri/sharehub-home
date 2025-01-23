import 'dart:async';

import 'package:get/get.dart';
import 'package:sharehub_home/model/graph_model.dart';
import 'package:sharehub_home/repo/graph_repo.dart';
import 'package:get_storage/get_storage.dart';

class GraphViewModel extends GetxController {
  var isLoading = false.obs;
  var graphDataMap = <String, List<GraphModel>>{}.obs;
  var selectedTimeFrame = "1D".obs;
  var selectedValue = "NEPSE".obs;
  var graphData = <GraphModel>[].obs;
  final box = GetStorage();
  var previousTimeFrame = "1D".obs;

  final GraphRepo _graphRepo = GraphRepo();

  @override
  void onInit() {
    readLocalGraphData();
    fetchGraphData();
    super.onInit();
    ever(graphDataMap, (_) => storeGraphData());
    fetchGraphDataPeriodically();
  }

  void readLocalGraphData() {
    var localData = box.read('graphDataMap');
    if (localData != null && localData is Map) {
      graphDataMap.value = localData.map((key, value) => MapEntry(
          key,
          (value as List)
              .map((e) =>
                  GraphModel.fromJson([e["time"], e["value"]], e["type"]))
              .toList()));
    } else {
      print('No local graph data found');
    }
  }

  void fetchGraphData() async {
    isLoading.value = true;
    var data = await _graphRepo.fetchData(selectedValue.value);
    if (data.isNotEmpty) {
      graphDataMap['1D_${selectedValue.value}'] = data;
      graphData.value = data; // Update graphData
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
    var dataToStore = graphDataMap.map(
        (key, value) => MapEntry(key, value.map((e) => e.toJson()).toList()));
    box.write('graphDataMap', dataToStore);
  }

  Future<void> fetchGraphDataForTimeFrame() async {
    isLoading.value = true;
    var data = await _graphRepo.fetchDataForTimeFrame(
        selectedTimeFrame.value, selectedValue.value);
    if (data.isNotEmpty) {
      graphDataMap['${selectedTimeFrame.value}_${selectedValue.value}'] = data;
      graphData.value = data; // Update graphData
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
    previousTimeFrame.value = selectedTimeFrame.value;
    selectedTimeFrame.value = timeFrame;
    if (timeFrame == "1D") {
      fetchGraphData();
    } else {
      fetchGraphDataForTimeFrame();
    }
  }

  List<GraphModel> getGraphDataForCurrentSelection() {
    return graphDataMap['${selectedTimeFrame.value}_${selectedValue.value}'] ??
        [];
  }
}
