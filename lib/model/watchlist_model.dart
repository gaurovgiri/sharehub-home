class WatchListModel {
  final String? logo;
  final String? name;
  final String? symbol;
  final double? lastTradedPrice;
  final double? change;
  final double? changePercent;

  WatchListModel({
    required this.logo,
    required this.name,
    required this.symbol,
    required this.lastTradedPrice,
    required this.change,
    required this.changePercent,
  });

  factory WatchListModel.fromJson(Map<String, dynamic> json) {
    return WatchListModel(
      logo: json['logo'],
      name: json['name'],
      symbol: json['symbol'],
      lastTradedPrice: json['lastTradedPrice'].toDouble(),
      change: json['change'].toDouble(),
      changePercent: json['changePercent'].toDouble(),
    );
  }
}
