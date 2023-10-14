import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/utils/calculations.dart';

import 'package:smart_home/utils/strings.dart';
import 'package:smart_home/viewmodels/device_summary_viewmodel.dart';
import 'package:smart_home/widgets/tables/table_header_item.dart';
import 'package:smart_home/widgets/tables/table_row_item.dart';

class DeviceSummaryDatagrid extends StatelessWidget {
  const DeviceSummaryDatagrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DeviceSummaryViewModel>(builder: (context, model, child) {
      return Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Card(
              elevation: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TableHeaderItem(content: AppString.perDeviceDataTableHeaderDevice),
                  TableHeaderItem(content: AppString.perDeviceDataTableHeaderUsageHours),
                  TableHeaderItem(content: AppString.perDeviceDataTableHeaderWattage),
                  TableHeaderItem(content: AppString.perDeviceDataTableHeaderCost),
                  TableHeaderItem(content: AppString.perDeviceDataTableHeaderTotalCost),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
              child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                  padding: const EdgeInsets.all(8),
                  itemCount: model.deviceList.length,
                  itemBuilder: (BuildContext context, int index) {
                    List<String> values = [
                      (model.deviceList[index].deviceName ?? AppString.dataUnavailable),
                      (model.deviceList[index].usageHours != null
                          ? model.deviceList[index].usageHours.toString()
                          : AppString.dataUnavailable),
                      (model.deviceList[index].wattage != null
                          ? (Calculations.getWattage(model.deviceList[index].wattage!)).toString()
                          : AppString.dataUnavailable),
                      (model.deviceList[index].costPerKwh != null
                          ? (Calculations.getCostPerKwh(model.deviceList[index].costPerKwh!)).toString()
                          : AppString.dataUnavailable),
                      (Calculations.getTotalCost(
                              Calculations.getCostPerKwh(model.deviceList[index].costPerKwh!),
                              Calculations.getWattage(model.deviceList[index].wattage!),
                              model.deviceList[index].usageHours!)
                          .toString())
                    ];

                    return TableRowItem(values: values);
                  }))
        ],
      );
    });
  }
}
