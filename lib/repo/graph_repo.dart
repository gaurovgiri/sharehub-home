import 'package:dio/dio.dart';
import 'package:sharehub_home/model/graph_model.dart';

class GraphRepo {
  final Dio _dio = Dio();
  final String graphURI =
      "https://sharehubnepal.com/live/api/v1/daily-graph/index/58";

  Future<List<GraphModel>> fetchData() async {
    try {
      final response = await _dio.get(graphURI);
      if (response.statusCode == 200) {
        List<GraphModel> graphData = [];
        for (var data in response.data) {
          graphData.add(GraphModel.fromJson(data));
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
