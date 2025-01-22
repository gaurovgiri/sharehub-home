class GraphModel {
  final DateTime time;
  final double value;
  final String? type;

  GraphModel({
    required this.time,
    required this.value,
    required this.type,
  });

  factory GraphModel.fromJson(List<dynamic> json, type) {
    return GraphModel(
      type: type,
      time: DateTime.fromMillisecondsSinceEpoch(json[0] * 1000),
      value: json[1].toDouble(),
    );
  }
}
