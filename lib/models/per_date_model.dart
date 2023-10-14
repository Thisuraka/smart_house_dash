import 'dart:convert';

class PerDateModel {
  final DateTime? date;
  final int? usageHours;
  final int? wattage;
  final double? costPerKwh;

  PerDateModel({
    this.date,
    this.usageHours,
    this.wattage,
    this.costPerKwh,
  });

  PerDateModel copyWith({
    DateTime? date,
    String? deviceName,
    int? usageHours,
    int? wattage,
    double? costPerKwh,
  }) {
    return PerDateModel(
      date: date ?? this.date,
      usageHours: usageHours ?? this.usageHours,
      wattage: wattage ?? this.wattage,
      costPerKwh: costPerKwh ?? this.costPerKwh,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'usage_hours': usageHours,
      'wattage': wattage,
      'cost_per_kwh': costPerKwh,
    };
  }

  factory PerDateModel.fromMap(Map<String, dynamic> map) {
    return PerDateModel(
      date: map['date'] != null ? map['date'] as DateTime : null,
      usageHours: map['usage_hours'] != null ? map['usage_hours'] as int : null,
      wattage: map['wattage'] != null ? map['wattage'] as int : null,
      costPerKwh: map['cost_per_kwh'] != null ? map['cost_per_kwh'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PerDateModel.fromJson(Map<String, dynamic> json) {
    return PerDateModel(
      date: DateTime.parse(json['date']),
      usageHours: int.parse(json['usage_hours']),
      wattage: int.parse(json['wattage']),
      costPerKwh: double.parse(json['cost_per_kwh']),
    );
  }

  @override
  String toString() {
    return 'PerDateModel(date: $date,  usageHours: $usageHours, wattage: $wattage, costPerKwh: $costPerKwh)';
  }

  @override
  bool operator ==(covariant PerDateModel other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.usageHours == usageHours &&
        other.wattage == wattage &&
        other.costPerKwh == costPerKwh;
  }

  @override
  int get hashCode {
    return date.hashCode ^ usageHours.hashCode ^ wattage.hashCode ^ costPerKwh.hashCode;
  }
}
