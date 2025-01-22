import 'package:dio/dio.dart';
import 'package:sharehub_home/model/market_model.dart';

class MarketRepository {
  final _marketApiURI =
      "https://sharehubnepal.com/live/api/v2/nepselive/home-page-data";
  final _dio = Dio();

  Future<MarketModel?> fetch() async {
    try {
      final response = await _dio.get(_marketApiURI);
      if (response.statusCode == 200) {
        return MarketModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
