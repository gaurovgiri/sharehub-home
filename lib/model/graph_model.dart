class GraphModel {
  final DateTime time;
  final double value;

  GraphModel({
    required this.time,
    required this.value,
  });

  factory GraphModel.fromJson(List<dynamic> json) {
    return GraphModel(
      time: DateTime.fromMillisecondsSinceEpoch(json[0] * 1000),
      value: json[1].toDouble(),
    );
  }
}
