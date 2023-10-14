// ignore_for_file: public_member_api_docs, sort_constructors_first
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
      deviceName: map['deviceName'] != null ? map['deviceName'] as String : null,
      usageHours: map['usageHours'] != null ? map['usageHours'] as int : null,
      wattage: map['wattage'] != null ? map['wattage'] as int : null,
      costPerKwh: map['costPerKwh'] != null ? map['costPerKwh'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PerDeviceModel.fromJson(String source) =>
      PerDeviceModel.fromMap(json.decode(source) as Map<String, dynamic>);

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
