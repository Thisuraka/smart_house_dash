import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/style.dart';
import 'package:smart_home/utils/navigation_service.dart';

import 'package:smart_home/utils/strings.dart';
import 'package:smart_home/viewmodels/consumption_viewmodel.dart';
import 'package:smart_home/widgets/date_filter_widget.dart';
import 'package:smart_home/widgets/page_title_subtitle.dart';

class ConsumptionTab extends StatelessWidget {
  const ConsumptionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ConsumptionViewModel>(builder: (context, model, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          pageTitleSubtitle(
              context: context,
              subtitle2: AppString.consumptionSummaryTitle,
              subtitle3: AppString.consumptionSummaryDesc),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DateFilterWidget(
                pickedDate: model.pickedDate,
                selectedDates: (DateTime pickedDate) {
                  model.setDate(pickedDate);
                },
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
                  ))
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          model.consumptionModel != null
              ? Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    statusCard(
                      title: AppString.analysisPerMonth,
                      status: model.consumptionModel!.monthlyStatus!,
                      difference: model.consumptionModel!.monthlyDifference!,
                      percntage: model.consumptionModel!.monthlyDifferencePercentage!,
                    ),
                    statusCard(
                      title: AppString.analysisPerHome,
                      status: model.consumptionModel!.householdStatus!,
                      difference: model.consumptionModel!.householdDifference!,
                      percntage: model.consumptionModel!.householdPercentage!,
                    ),
                  ],
                )
              : Container(
                  alignment: Alignment.center,
                  height:
                      MediaQuery.of(NavigationService.navigatorKey.currentState!.context).size.height * 0.4,
                  child: const Text(AppString.selectDate),
                )
        ],
      );
    });
  }

  statusCard(
      {required String title,
      required String status,
      required String difference,
      required String percntage}) {
    return Card(
      elevation: 1,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(NavigationService.navigatorKey.currentState!.context).size.width * 0.3,
        height: MediaQuery.of(NavigationService.navigatorKey.currentState!.context).size.height * 0.4,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            status,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.chartBlue,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Text(
            AppString.by,
          ),
          Text(
            '$difference units',
            style: TextStyle(fontSize: 20, color: AppColors.chartBlue, fontWeight: FontWeight.w400),
          ),
          const Text(
            AppString.whichIs,
          ),
          Text(
            '$percntage %',
            style: TextStyle(fontSize: 20, color: AppColors.chartBlue, fontWeight: FontWeight.w400),
          ),
        ]),
      ),
    );
  }
}
