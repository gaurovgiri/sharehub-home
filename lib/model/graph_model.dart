class GraphModel {
  final DateTime time;
  final double value;
  final String? type;

  GraphModel({
    required this.time,
    required this.value,
    required this.type,
  });

  factory GraphModel.fromJson(List<dynamic> json, String type) {
    return GraphModel(
      time: DateTime.fromMillisecondsSinceEpoch(json[0] * 1000),
      value: json[1].toDouble(),
      type: type,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time.millisecondsSinceEpoch ~/ 1000,
      'value': value,
      'type': type,
    };
  }
}
