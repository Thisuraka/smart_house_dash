import 'package:flutter/material.dart';
import 'package:smart_home/models/per_device_and_date_model.dart';

class PerDeviceDatagrid extends StatelessWidget {
  const PerDeviceDatagrid({required this.perDeviceList, super.key});

  final List<PerDeviceModel> perDeviceList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: const Text("Data grid comes here"),
    );
  }
}
