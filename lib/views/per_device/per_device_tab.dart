import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/viewmodels/per_device_viewmodel.dart';
import 'package:smart_home/widgets/date_filter_widget.dart';

class PerDeviceTab extends StatelessWidget {
  const PerDeviceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PerDeviceViewModel>(builder: (context, model, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DateFilterWidget(
            selectedDates: (DateTime startDate, DateTime endDate) {
              model.setStartAndEndDate(startDate, endDate);
            },
          ),
        ],
      );
    });
  }
}
