class MonthPredictionModel {
  final int timestamp;
  final double value;

  MonthPredictionModel({
    required this.timestamp,
    required this.value,
  });

  factory MonthPredictionModel.fromJson(Map<String, dynamic> json) {
    final timestamp = int.tryParse(json.keys.first) ?? 0;
    final value = json.values.first?.toDouble() ?? 0.0;
    return MonthPredictionModel(timestamp: timestamp, value: value);
  }
}
