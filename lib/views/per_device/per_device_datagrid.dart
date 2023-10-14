import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_home/utils/strings.dart';
import 'package:smart_home/viewmodels/per_device_viewmodel.dart';
import 'package:smart_home/widgets/tables/table_header_item.dart';
import 'package:smart_home/widgets/tables/table_row_item.dart';

class PerDeviceDatagrid extends StatelessWidget {
  const PerDeviceDatagrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PerDeviceViewModel>(builder: (context, model, child) {
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
                          ? model.deviceList[index].wattage.toString()
                          : AppString.dataUnavailable),
                      (model.deviceList[index].costPerKwh != null
                          ? model.deviceList[index].costPerKwh.toString()
                          : AppString.dataUnavailable),
                      ((model.deviceList[index].usageHours! * model.deviceList[index].costPerKwh!).toString())
                    ];

                    return TableRowItem(values: values);
                  }))
        ],
      );
    });
  }
}
