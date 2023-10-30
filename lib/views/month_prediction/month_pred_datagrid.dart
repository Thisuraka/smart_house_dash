import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:smart_home/utils/strings.dart';
import 'package:smart_home/viewmodels/consumption_prediction_viewmodel.dart';
import 'package:smart_home/widgets/tables/table_header_item.dart';
import 'package:smart_home/widgets/tables/table_row_item.dart';

class MonthPredDatagrid extends StatelessWidget {
  const MonthPredDatagrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ConsumptionPredictionViewModel>(builder: (context, model, child) {
      return Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Card(
              elevation: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TableHeaderItem(content: AppString.consumptionPredictionMonth),
                  TableHeaderItem(content: AppString.consumptionPredictionUnits),
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
                  itemCount: model.consumptionPredList.length,
                  itemBuilder: (BuildContext context, int index) {
                    String formattedDate = DateFormat('MM/yyyy').format(
                        DateTime.fromMillisecondsSinceEpoch(model.consumptionPredList[index].timestamp));

                    List<String> values = [
                      (formattedDate),
                      ('${model.consumptionPredList[index].value.toStringAsFixed(2)} kwh'),
                    ];

                    return TableRowItem(values: values);
                  }))
        ],
      );
    });
  }
}
