import 'package:dio/dio.dart';
import 'package:sharehub_home/model/graph_model.dart';

class GraphRepo {
  final Dio _dio = Dio();

  Future<List<GraphModel>> fetchData(String selectedValue) async {
    try {
      final response = await _dio.get(
          "https://sharehubnepal.com/live/api/v1/daily-graph/index/$selectedValue");
      if (response.statusCode == 200) {
        List<GraphModel> graphData = [];
        for (var data in response.data) {
          graphData.add(GraphModel.fromJson(data, "1D"));
        }
        return graphData;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<GraphModel>> fetchDataForTimeFrame(
      String timeFrame, String selectedValue) async {
    try {
      final response = await _dio.get(
          "https://arthakendra.com/data/api/v1/price-history/graph/$selectedValue?time=$timeFrame&queryKey=$selectedValue");
      if (response.statusCode == 200) {
        List<GraphModel> graphData = [];
        for (var data in response.data['data']) {
          dynamic _data = [
            DateTime.parse(data['date']).millisecondsSinceEpoch,
            data['value']
          ];
          graphData.add(GraphModel.fromJson(_data, timeFrame));
        }
        return graphData;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
