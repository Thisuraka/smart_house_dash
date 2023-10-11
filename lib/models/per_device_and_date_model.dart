import 'dart:convert';

class PerDeviceModel {
  final String? deviceName;
  final int? usageHours;
  final int? wattage;
  final double? costPerKwh;

  PerDeviceModel({
    this.deviceName,
    this.usageHours,
    this.wattage,
    this.costPerKwh,
  });

  PerDeviceModel copyWith({
    String? deviceName,
    int? usageHours,
    int? wattage,
    double? costPerKwh,
  }) {
    return PerDeviceModel(
      deviceName: deviceName ?? this.deviceName,
      usageHours: usageHours ?? this.usageHours,
      wattage: wattage ?? this.wattage,
      costPerKwh: costPerKwh ?? this.costPerKwh,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'device_name': deviceName,
      'usage_hours': usageHours,
      'wattage': wattage,
      'cost_per_kwh': costPerKwh,
    };
  }

  factory PerDeviceModel.fromMap(Map<String, dynamic> map) {
    return PerDeviceModel(
      deviceName: map['device_name'] != null ? map['device_name'] as String : null,
      usageHours: map['usage_hours'] != null ? map['usage_hours'] as int : null,
      wattage: map['wattage'] != null ? map['wattage'] as int : null,
      costPerKwh: map['cost_per_kwh'] != null ? map['cost_per_kwh'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PerDeviceModel.fromJson(String source) =>
      PerDeviceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PerDeviceModel(deviceName: $deviceName, usageHours: $usageHours, wattage: $wattage, costPerKwh: $costPerKwh)';
  }

  @override
  bool operator ==(covariant PerDeviceModel other) {
    if (identical(this, other)) return true;

    return other.deviceName == deviceName &&
        other.usageHours == usageHours &&
        other.wattage == wattage &&
        other.costPerKwh == costPerKwh;
  }

  @override
  int get hashCode {
    return deviceName.hashCode ^ usageHours.hashCode ^ wattage.hashCode ^ costPerKwh.hashCode;
  }
}

class PerDeviceAndDateModel {
  final Map<String, PerDeviceModel> dateUsages;

  PerDeviceAndDateModel({
    required this.dateUsages,
  });

  factory PerDeviceAndDateModel.fromJson(Map<String, dynamic> json) {
    Map<String, PerDeviceModel> dateUsages = {};
    json.forEach((date, dateUsage) {
      dateUsages[date] = PerDeviceModel.fromJson(dateUsage);
    });

    return PerDeviceAndDateModel(dateUsages: dateUsages);
  }
}
