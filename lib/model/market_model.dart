class MarketModel {
  MarketStatus? marketStatus;
  List<MarketSummary>? marketSummary;
  StockSummary? stockSummary;
  List<Indices>? indices;
  List<SubIndices>? subIndices;
  List<TopGainers>? topGainers;
  List<TopLosers>? topLosers;
  List<TopTurnover>? topTurnover;
  List<TopTradedShares>? topTradedShares;
  List<TopTransactions>? topTransactions;
  List<dynamic>? demand;
  List<dynamic>? supply;

  MarketModel(
      {this.marketStatus,
      this.marketSummary,
      this.stockSummary,
      this.indices,
      this.subIndices,
      this.topGainers,
      this.topLosers,
      this.topTurnover,
      this.topTradedShares,
      this.topTransactions,
      this.demand,
      this.supply});

  MarketModel.fromJson(Map<String, dynamic> json) {
    marketStatus = json["marketStatus"] == null
        ? null
        : MarketStatus.fromJson(json["marketStatus"]);
    marketSummary = json["marketSummary"] == null
        ? null
        : (json["marketSummary"] as List)
            .map((e) => MarketSummary.fromJson(e))
            .toList();
    stockSummary = json["stockSummary"] == null
        ? null
        : StockSummary.fromJson(json["stockSummary"]);
    indices = json["indices"] == null
        ? null
        : (json["indices"] as List).map((e) => Indices.fromJson(e)).toList();
    subIndices = json["subIndices"] == null
        ? null
        : (json["subIndices"] as List)
            .map((e) => SubIndices.fromJson(e))
            .toList();
    topGainers = json["topGainers"] == null
        ? null
        : (json["topGainers"] as List)
            .map((e) => TopGainers.fromJson(e))
            .toList();
    topLosers = json["topLosers"] == null
        ? null
        : (json["topLosers"] as List)
            .map((e) => TopLosers.fromJson(e))
            .toList();
    topTurnover = json["topTurnover"] == null
        ? null
        : (json["topTurnover"] as List)
            .map((e) => TopTurnover.fromJson(e))
            .toList();
    topTradedShares = json["topTradedShares"] == null
        ? null
        : (json["topTradedShares"] as List)
            .map((e) => TopTradedShares.fromJson(e))
            .toList();
    topTransactions = json["topTransactions"] == null
        ? null
        : (json["topTransactions"] as List)
            .map((e) => TopTransactions.fromJson(e))
            .toList();
    demand = json["demand"] ?? [];
    supply = json["supply"] ?? [];
  }

  static List<MarketModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(MarketModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (marketStatus != null) {
      _data["marketStatus"] = marketStatus?.toJson();
    }
    if (marketSummary != null) {
      _data["marketSummary"] = marketSummary?.map((e) => e.toJson()).toList();
    }
    if (stockSummary != null) {
      _data["stockSummary"] = stockSummary?.toJson();
    }
    if (indices != null) {
      _data["indices"] = indices?.map((e) => e.toJson()).toList();
    }
    if (subIndices != null) {
      _data["subIndices"] = subIndices?.map((e) => e.toJson()).toList();
    }
    if (topGainers != null) {
      _data["topGainers"] = topGainers?.map((e) => e.toJson()).toList();
    }
    if (topLosers != null) {
      _data["topLosers"] = topLosers?.map((e) => e.toJson()).toList();
    }
    if (topTurnover != null) {
      _data["topTurnover"] = topTurnover?.map((e) => e.toJson()).toList();
    }
    if (topTradedShares != null) {
      _data["topTradedShares"] =
          topTradedShares?.map((e) => e.toJson()).toList();
    }
    if (topTransactions != null) {
      _data["topTransactions"] =
          topTransactions?.map((e) => e.toJson()).toList();
    }
    if (demand != null) {
      _data["demand"] = demand;
    }
    if (supply != null) {
      _data["supply"] = supply;
    }
    return _data;
  }
}

class TopTransactions {
  String? symbol;
  String? name;
  String? icon;
  int? transactions;
  double? lastTradedPrice;
  double? change;
  double? changePercent;

  TopTransactions(
      {this.symbol,
      this.name,
      this.icon,
      this.transactions,
      this.lastTradedPrice,
      this.change,
      this.changePercent});

  TopTransactions.fromJson(Map<String, dynamic> json) {
    symbol = json["symbol"];
    name = json["name"];
    icon = json["icon"];
    transactions = json["transactions"];
    lastTradedPrice = json["lastTradedPrice"]?.toDouble();
    change = json["change"]?.toDouble();
    changePercent = json["changePercent"]?.toDouble();
  }

  static List<TopTransactions> fromList(List<Map<String, dynamic>> list) {
    return list.map(TopTransactions.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["symbol"] = symbol;
    _data["name"] = name;
    _data["icon"] = icon;
    _data["transactions"] = transactions;
    _data["lastTradedPrice"] = lastTradedPrice;
    _data["change"] = change;
    _data["changePercent"] = changePercent;
    return _data;
  }
}

class TopTradedShares {
  String? symbol;
  String? name;
  String? icon;
  int? sharesTraded;
  double? lastTradedPrice;
  double? change;
  double? changePercent;

  TopTradedShares(
      {this.symbol,
      this.name,
      this.icon,
      this.sharesTraded,
      this.lastTradedPrice,
      this.change,
      this.changePercent});

  TopTradedShares.fromJson(Map<String, dynamic> json) {
    symbol = json["symbol"];
    name = json["name"];
    icon = json["icon"];
    sharesTraded = json["sharesTraded"];
    lastTradedPrice = json["lastTradedPrice"]?.toDouble();
    change = json["change"]?.toDouble();
    changePercent = json["changePercent"]?.toDouble();
  }

  static List<TopTradedShares> fromList(List<Map<String, dynamic>> list) {
    return list.map(TopTradedShares.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["symbol"] = symbol;
    _data["name"] = name;
    _data["icon"] = icon;
    _data["sharesTraded"] = sharesTraded;
    _data["lastTradedPrice"] = lastTradedPrice;
    _data["change"] = change;
    _data["changePercent"] = changePercent;
    return _data;
  }
}

class TopTurnover {
  String? symbol;
  String? name;
  String? icon;
  double? turnover;
  double? lastTradedPrice;
  double? change;
  double? changePercent;

  TopTurnover(
      {this.symbol,
      this.name,
      this.icon,
      this.turnover,
      this.lastTradedPrice,
      this.change,
      this.changePercent});

  TopTurnover.fromJson(Map<String, dynamic> json) {
    symbol = json["symbol"];
    name = json["name"];
    icon = json["icon"];
    turnover = json["turnover"]?.toDouble();
    lastTradedPrice = json["lastTradedPrice"]?.toDouble();
    change = json["change"]?.toDouble();
    changePercent = json["changePercent"]?.toDouble();
  }

  static List<TopTurnover> fromList(List<Map<String, dynamic>> list) {
    return list.map(TopTurnover.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["symbol"] = symbol;
    _data["name"] = name;
    _data["icon"] = icon;
    _data["turnover"] = turnover;
    _data["lastTradedPrice"] = lastTradedPrice;
    _data["change"] = change;
    _data["changePercent"] = changePercent;
    return _data;
  }
}

class TopLosers {
  String? symbol;
  String? name;
  String? icon;
  double? lastTradedPrice;
  double? change;
  double? changePercent;

  TopLosers(
      {this.symbol,
      this.name,
      this.icon,
      this.lastTradedPrice,
      this.change,
      this.changePercent});

  TopLosers.fromJson(Map<String, dynamic> json) {
    symbol = json["symbol"];
    name = json["name"];
    icon = json["icon"];
    lastTradedPrice = json["lastTradedPrice"]?.toDouble();
    change = json["change"]?.toDouble();
    changePercent = json["changePercent"]?.toDouble();
  }

  static List<TopLosers> fromList(List<Map<String, dynamic>> list) {
    return list.map(TopLosers.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["symbol"] = symbol;
    _data["name"] = name;
    _data["icon"] = icon;
    _data["lastTradedPrice"] = lastTradedPrice;
    _data["change"] = change;
    _data["changePercent"] = changePercent;
    return _data;
  }
}

class TopGainers {
  String? symbol;
  String? name;
  String? icon;
  double? lastTradedPrice;
  double? change;
  double? changePercent;

  TopGainers(
      {this.symbol,
      this.name,
      this.icon,
      this.lastTradedPrice,
      this.change,
      this.changePercent});

  TopGainers.fromJson(Map<String, dynamic> json) {
    symbol = json["symbol"];
    name = json["name"];
    icon = json["icon"];
    lastTradedPrice = json["lastTradedPrice"]?.toDouble();
    change = json["change"]?.toDouble();
    changePercent = json["changePercent"]?.toDouble();
  }

  static List<TopGainers> fromList(List<Map<String, dynamic>> list) {
    return list.map(TopGainers.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["symbol"] = symbol;
    _data["name"] = name;
    _data["icon"] = icon;
    _data["lastTradedPrice"] = lastTradedPrice;
    _data["change"] = change;
    _data["changePercent"] = changePercent;
    return _data;
  }
}

class SubIndices {
  String? name;
  String? symbol;
  double? currentValue;
  double? change;
  double? changePercent;
  String? sector;

  SubIndices(
      {this.name,
      this.symbol,
      this.currentValue,
      this.change,
      this.changePercent,
      this.sector});

  SubIndices.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    symbol = json["symbol"];
    currentValue = json["currentValue"]?.toDouble();
    change = json["change"]?.toDouble();
    changePercent = json["changePercent"]?.toDouble();
    sector = json["sector"];
  }

  static List<SubIndices> fromList(List<Map<String, dynamic>> list) {
    return list.map(SubIndices.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["symbol"] = symbol;
    _data["currentValue"] = currentValue;
    _data["change"] = change;
    _data["changePercent"] = changePercent;
    _data["sector"] = sector;
    return _data;
  }
}

class Indices {
  String? name;
  String? symbol;
  double? currentValue;
  double? change;
  double? changePercent;
  dynamic sector;

  Indices(
      {this.name,
      this.symbol,
      this.currentValue,
      this.change,
      this.changePercent,
      this.sector});

  Indices.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    symbol = json["symbol"];
    currentValue = json["currentValue"]?.toDouble();
    change = json["change"]?.toDouble();
    changePercent = json["changePercent"]?.toDouble();
    sector = json["sector"];
  }

  static List<Indices> fromList(List<Map<String, dynamic>> list) {
    return list.map(Indices.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["symbol"] = symbol;
    _data["currentValue"] = currentValue;
    _data["change"] = change;
    _data["changePercent"] = changePercent;
    _data["sector"] = sector;
    return _data;
  }
}

class StockSummary {
  int? advanced;
  int? declined;
  int? unchanged;
  int? positiveCircuit;
  int? negativeCircuit;

  StockSummary(
      {this.advanced,
      this.declined,
      this.unchanged,
      this.positiveCircuit,
      this.negativeCircuit});

  StockSummary.fromJson(Map<String, dynamic> json) {
    advanced = json["advanced"];
    declined = json["declined"];
    unchanged = json["unchanged"];
    positiveCircuit = json["positiveCircuit"];
    negativeCircuit = json["negativeCircuit"];
  }

  static List<StockSummary> fromList(List<Map<String, dynamic>> list) {
    return list.map(StockSummary.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["advanced"] = advanced;
    _data["declined"] = declined;
    _data["unchanged"] = unchanged;
    _data["positiveCircuit"] = positiveCircuit;
    _data["negativeCircuit"] = negativeCircuit;
    return _data;
  }
}

class MarketSummary {
  String? name;
  double? value;

  MarketSummary({this.name, this.value});

  MarketSummary.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    value = json["value"]?.toDouble();
  }

  static List<MarketSummary> fromList(List<Map<String, dynamic>> list) {
    return list.map(MarketSummary.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["value"] = value;
    return _data;
  }
}

class MarketStatus {
  String? status;
  String? time;

  MarketStatus({this.status, this.time});

  MarketStatus.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    time = json["time"];
  }

  static List<MarketStatus> fromList(List<Map<String, dynamic>> list) {
    return list.map(MarketStatus.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["time"] = time;
    return _data;
  }
}
