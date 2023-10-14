import 'dart:convert';

class PerDeviceModel {
  final String? date;
  final String? deviceName;
  final int? usageHours;
  final int? wattage;
  final double? costPerKwh;

  PerDeviceModel({
    this.date,
    this.deviceName,
    this.usageHours,
    this.wattage,
    this.costPerKwh,
  });

  PerDeviceModel copyWith({
    String? date,
    String? deviceName,
    int? usageHours,
    int? wattage,
    double? costPerKwh,
  }) {
    return PerDeviceModel(
      date: date ?? this.date,
      deviceName: deviceName ?? this.deviceName,
      usageHours: usageHours ?? this.usageHours,
      wattage: wattage ?? this.wattage,
      costPerKwh: costPerKwh ?? this.costPerKwh,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'deviceName': deviceName,
      'usageHours': usageHours,
      'wattage': wattage,
      'costPerKwh': costPerKwh,
    };
  }

  factory PerDeviceModel.fromMap(Map<String, dynamic> map) {
    return PerDeviceModel(
      date: map['date'] != null ? map['date'] as String : null,
      deviceName: map['device'] != null ? map['device'] as String : null,
      usageHours: map['usage_hours'] != null ? map['usage_hours'] as int : null,
      wattage: map['wattage'] != null ? map['wattage'] as int : null,
      costPerKwh: map['cost_per_kwh'] != null ? map['cost_per_kwh'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PerDeviceModel.fromJson(Map<String, dynamic> json) {
    return PerDeviceModel(
      date: json['date'],
      deviceName: json['device'],
      usageHours: int.parse(json['usage_hours']),
      wattage: int.parse(json['wattage']),
      costPerKwh: double.parse(json['cost_per_kwh']),
    );
  }

  @override
  String toString() {
    return 'PerDeviceModel(date: $date, deviceName: $deviceName, usageHours: $usageHours, wattage: $wattage, costPerKwh: $costPerKwh)';
  }

  @override
  bool operator ==(covariant PerDeviceModel other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.deviceName == deviceName &&
        other.usageHours == usageHours &&
        other.wattage == wattage &&
        other.costPerKwh == costPerKwh;
  }

  @override
  int get hashCode {
    return date.hashCode ^ deviceName.hashCode ^ usageHours.hashCode ^ wattage.hashCode ^ costPerKwh.hashCode;
  }
}
