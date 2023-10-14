import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_home/style.dart';
import 'package:smart_home/utils/strings.dart';
import 'package:smart_home/viewmodels/per_date_viewmodel.dart';
import 'package:smart_home/views/per_date/per_date_chart.dart';
import 'package:smart_home/views/per_date/per_date_datagrid.dart';
import 'package:smart_home/widgets/date_range_filter_widget.dart';
import 'package:smart_home/widgets/page_title_subtitle.dart';

class PerDateTab extends StatelessWidget {
  const PerDateTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PerDateViewModel>(builder: (context, model, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          pageTitleSubtitle(
              context: context, subtitle2: AppString.perDateTitle, subtitle3: AppString.perDateDesc),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DateRangeFilterWidget(
                pickedStartDate: model.startDate,
                pickedEndDate: model.endDate,
                selectedDates: (DateTime start, DateTime end) {
                  model.setDate(start, end);
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
          Visibility(
            visible: model.dateList.isNotEmpty,
            child: Expanded(
              child: Row(
                children: [
                  const Flexible(
                    flex: 2,
                    child: Card(
                      elevation: 2,
                      child: PerDateDatagrid(),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Card(
                      elevation: 2,
                      child: PerDateChart(perDateList: model.dateList),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
