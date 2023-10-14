import 'package:flutter/material.dart';
import 'package:smart_home/widgets/tables/table_row_item.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/utils/strings.dart';
import 'package:smart_home/viewmodels/per_device_viewmodel.dart';
import 'package:smart_home/widgets/tables/table_header_item.dart';

class PerDeviceDatagrid extends StatelessWidget {
  const PerDeviceDatagrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PerDeviceViewModel>(builder: (context, model, child) {
      return Column(
        children: [
          const Card(
            elevation: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TableHeaderItem(
                    content: AppString.perDeviceDataTableHeaderDate),
                TableHeaderItem(
                    content: AppString.perDeviceDataTableHeaderDevice),
                TableHeaderItem(
                    content: AppString.perDeviceDataTableHeaderUsageHours),
                TableHeaderItem(
                    content: AppString.perDeviceDataTableHeaderWattage),
                TableHeaderItem(
                    content: AppString.perDeviceDataTableHeaderCost),
                TableHeaderItem(
                    content: AppString.perDeviceDataTableHeaderTotalCost),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
              child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  padding: const EdgeInsets.all(8),
                  itemCount: model.sampleData.length,
                  itemBuilder: (BuildContext context, int index) {
                    List<String> values = [
                      (model.sampleData[index].date ??
                          AppString.dataUnavailable),
                      (model.sampleData[index].deviceName ??
                          AppString.dataUnavailable),
                      (model.sampleData[index].usageHours != null
                          ? model.sampleData[index].usageHours.toString()
                          : AppString.dataUnavailable),
                      (model.sampleData[index].wattage != null
                          ? model.sampleData[index].wattage.toString()
                          : AppString.dataUnavailable),
                      (model.sampleData[index].costPerKwh != null
                          ? model.sampleData[index].costPerKwh.toString()
                          : AppString.dataUnavailable),
                      ((model.sampleData[index].usageHours! *
                              model.sampleData[index].costPerKwh!)
                          .toString())
                    ];

                    return TableRowItem(values: values);
                  }))
        ],
      );
    });
  }
}
