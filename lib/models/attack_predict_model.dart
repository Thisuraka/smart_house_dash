class AttackPredictModel {
  final String attack;
  final int count;

  AttackPredictModel({
    required this.attack,
    required this.count,
  });

  factory AttackPredictModel.fromJson(Map<String, dynamic> json) {
    return AttackPredictModel(
      attack: json['attack'] ?? "",
      count: int.tryParse(json['count'] ?? "0") ?? 0,
    );
  }
}
