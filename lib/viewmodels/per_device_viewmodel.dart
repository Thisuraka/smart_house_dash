import 'package:flutter/material.dart';

class PerDeviceViewModel extends ChangeNotifier {
  DateTime? startDate;
  DateTime? endDate;

  setStartAndEndDate(DateTime startDate, DateTime endDate) {
    startDate = startDate;
    endDate = endDate;
  }
}
