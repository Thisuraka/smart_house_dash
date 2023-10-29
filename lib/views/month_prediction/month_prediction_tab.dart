import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/style.dart';
import 'package:smart_home/utils/navigation_service.dart';

import 'package:smart_home/utils/strings.dart';
import 'package:smart_home/viewmodels/consumption_prediction_viewmodel.dart';
import 'package:smart_home/views/month_prediction/month_pred_datagrid.dart';
import 'package:smart_home/widgets/page_title_subtitle.dart';
import 'package:smart_home/widgets/rounded_textbox_widget.dart';
import 'package:smart_home/widgets/tables/table_header_item.dart';
import 'package:smart_home/widgets/tables/table_row_item.dart';

class ConsumptionPredictionTab extends StatelessWidget {
  const ConsumptionPredictionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ConsumptionPredictionViewModel>(builder: (context, model, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          pageTitleSubtitle(
              context: context,
              subtitle2: AppString.consumptionPredictionTitle,
              subtitle3: AppString.consumptionPredictionDesc),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: RoundedTextboxWidget(
                    controller: model.predictTillController,
                    labelText: AppString.consumptionPredictionSetMonths),
              ),
              IconButton(
                onPressed: () {
                  model.process();
                },
                icon: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.defaultColor,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Icon(
                    Icons.download_rounded,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          model.consumptionPredList.isNotEmpty
              ? const Flexible(
                  flex: 1,
                  child: Card(
                    elevation: 2,
                    child: MonthPredDatagrid(),
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  height:
                      MediaQuery.of(NavigationService.navigatorKey.currentState!.context).size.height * 0.4,
                  child: const Text(AppString.noData),
                )
        ],
      );
    });
  }
}
