// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ElectricityConsumptionModel {
  final String? householdStatus;
  final String? householdDifference;
  final String? householdPercentage;

  final String? monthlyDifference;
  final String? monthlyDifferencePercentage;
  final String? monthlyStatus;

  ElectricityConsumptionModel({
    required this.householdStatus,
    required this.householdDifference,
    required this.householdPercentage,
    required this.monthlyDifference,
    required this.monthlyDifferencePercentage,
    required this.monthlyStatus,
  });

  ElectricityConsumptionModel copyWith({
    String? householdStatus,
    String? householdDifference,
    String? householdPercentage,
    String? monthlyDifference,
    String? monthlyDifferencePercentage,
    String? monthlyStatus,
  }) {
    return ElectricityConsumptionModel(
      householdStatus: householdStatus ?? this.householdStatus,
      householdDifference: householdDifference ?? this.householdDifference,
      householdPercentage: householdPercentage ?? this.householdPercentage,
      monthlyDifference: monthlyDifference ?? this.monthlyDifference,
      monthlyDifferencePercentage: monthlyDifferencePercentage ?? this.monthlyDifferencePercentage,
      monthlyStatus: monthlyStatus ?? this.monthlyStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'householdStatus': householdStatus,
      'householdDifference': householdDifference,
      'householdPercentage': householdPercentage,
      'monthlyDifference': monthlyDifference,
      'monthlyDifferencePercentage': monthlyDifferencePercentage,
      'monthlyStatus': monthlyStatus,
    };
  }

  factory ElectricityConsumptionModel.fromMap(Map<String, dynamic> map) {
    return ElectricityConsumptionModel(
      householdStatus: map['householdStatus'] != null ? map['householdStatus'] as String : null,
      householdDifference: map['householdDifference'] != null ? map['householdDifference'] as String : null,
      householdPercentage: map['householdPercentage'] != null ? map['householdPercentage'] as String : null,
      monthlyDifference: map['monthlyDifference'] != null ? map['monthlyDifference'] as String : null,
      monthlyDifferencePercentage:
          map['monthlyDifferencePercentage'] != null ? map['monthlyDifferencePercentage'] as String : null,
      monthlyStatus: map['monthlyStatus'] != null ? map['monthlyStatus'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ElectricityConsumptionModel.fromJson(Map<String, dynamic> json) {
    return ElectricityConsumptionModel(
      householdDifference: json['household_difference'],
      householdPercentage: json['household_percentage'],
      householdStatus: json['household_status'],
      monthlyDifference: json['monthly_difference'],
      monthlyDifferencePercentage: json['monthly_difference_percentage'],
      monthlyStatus: json['monthly_status'],
    );
  }

  @override
  String toString() {
    return 'ElectricityConsumptionModel(householdStatus: $householdStatus, householdDifference: $householdDifference, householdPercentage: $householdPercentage, monthlyDifference: $monthlyDifference, monthlyDifferencePercentage: $monthlyDifferencePercentage, monthlyStatus: $monthlyStatus)';
  }

  @override
  bool operator ==(covariant ElectricityConsumptionModel other) {
    if (identical(this, other)) return true;

    return other.householdStatus == householdStatus &&
        other.householdDifference == householdDifference &&
        other.householdPercentage == householdPercentage &&
        other.monthlyDifference == monthlyDifference &&
        other.monthlyDifferencePercentage == monthlyDifferencePercentage &&
        other.monthlyStatus == monthlyStatus;
  }

  @override
  int get hashCode {
    return householdStatus.hashCode ^
        householdDifference.hashCode ^
        householdPercentage.hashCode ^
        monthlyDifference.hashCode ^
        monthlyDifferencePercentage.hashCode ^
        monthlyStatus.hashCode;
  }
}
