import 'package:flutter/material.dart';
import 'package:smart_home/models/per_device_and_date_model.dart';

class PerDeviceViewModel extends ChangeNotifier {
  DateTime? startDate;
  DateTime? endDate;

  List<PerDeviceModel> sampleData = [
    PerDeviceModel(
      date: "1697264489",
      deviceName: "Smart Thermostat",
      usageHours: 8,
      wattage: 60,
      costPerKwh: 45,
    ),
    PerDeviceModel(
      date: "1697264489",
      deviceName: "Smart Television",
      usageHours: 8,
      wattage: 25,
      costPerKwh: 45,
    ),
  ];

  setStartAndEndDate(DateTime startDate, DateTime endDate) {
    startDate = startDate;
    endDate = endDate;
  }
}
