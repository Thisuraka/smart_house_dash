import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/utils/calculations.dart';

import 'package:smart_home/utils/strings.dart';
import 'package:smart_home/viewmodels/per_date_viewmodel.dart';
import 'package:smart_home/widgets/tables/table_header_item.dart';
import 'package:smart_home/widgets/tables/table_row_item.dart';

class PerDateDatagrid extends StatelessWidget {
  const PerDateDatagrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PerDateViewModel>(builder: (context, model, child) {
      return Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Card(
              elevation: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TableHeaderItem(content: AppString.perDeviceDataTableHeaderDate),
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
                  itemCount: model.dateList.length,
                  itemBuilder: (BuildContext context, int index) {
                    List<String> values = [
                      (model.dateList[index].date != null
                          ? DateFormat('yyyy:MM:dd').format(model.dateList[index].date!)
                          : AppString.dataUnavailable),
                      (model.dateList[index].usageHours != null
                          ? model.dateList[index].usageHours.toString()
                          : AppString.dataUnavailable),
                      (model.dateList[index].wattage != null
                          ? (Calculations.getWattage(model.dateList[index].wattage!)).toString()
                          : AppString.dataUnavailable),
                      (model.dateList[index].costPerKwh != null
                          ? (Calculations.getCostPerKwh(model.dateList[index].costPerKwh!)).toString()
                          : AppString.dataUnavailable),
                      (Calculations.getTotalCost(
                              Calculations.getCostPerKwh(model.dateList[index].costPerKwh!),
                              Calculations.getWattage(model.dateList[index].wattage!),
                              model.dateList[index].usageHours!)
                          .toString())
                    ];

                    return TableRowItem(values: values);
                  }))
        ],
      );
    });
  }
}
