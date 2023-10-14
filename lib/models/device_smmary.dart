import 'dart:convert';

class DeviceSummaryModel {
  final String? deviceName;
  final int? usageHours;
  final int? wattage;
  final double? costPerKwh;

  DeviceSummaryModel({
    this.deviceName,
    this.usageHours,
    this.wattage,
    this.costPerKwh,
  });

  DeviceSummaryModel copyWith({
    String? deviceName,
    int? usageHours,
    int? wattage,
    double? costPerKwh,
  }) {
    return DeviceSummaryModel(
      deviceName: deviceName ?? this.deviceName,
      usageHours: usageHours ?? this.usageHours,
      wattage: wattage ?? this.wattage,
      costPerKwh: costPerKwh ?? this.costPerKwh,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'deviceName': deviceName,
      'usageHours': usageHours,
      'wattage': wattage,
      'costPerKwh': costPerKwh,
    };
  }

  factory DeviceSummaryModel.fromMap(Map<String, dynamic> map) {
    return DeviceSummaryModel(
      deviceName: map['name'] != null ? map['name'] as String : null,
      usageHours: map['usageHours'] != null ? map['usageHours'] as int : null,
      wattage: map['wattage'] != null ? map['wattage'] as int : null,
      costPerKwh: map['costPerKwh'] != null ? map['costPerKwh'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeviceSummaryModel.fromJson(Map<String, dynamic> json) {
    return DeviceSummaryModel(
      deviceName: json['name'],
      usageHours: json['usage_hours'],
      wattage: json['wattage'],
      costPerKwh: (json['cost_per_kwh'] / 100).toDouble(),
    );
  }

  @override
  String toString() {
    return 'DeviceSummaryModel(deviceName: $deviceName, usageHours: $usageHours, wattage: $wattage, costPerKwh: $costPerKwh)';
  }

  @override
  bool operator ==(covariant DeviceSummaryModel other) {
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
