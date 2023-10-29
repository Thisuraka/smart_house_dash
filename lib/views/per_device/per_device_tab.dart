import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_home/style.dart';
import 'package:smart_home/utils/strings.dart';
import 'package:smart_home/viewmodels/per_device_viewmodel.dart';
import 'package:smart_home/views/per_device/per_device_chart.dart';
import 'package:smart_home/views/per_device/per_device_datagrid.dart';
import 'package:smart_home/widgets/date_filter_widget.dart';
import 'package:smart_home/widgets/page_title_subtitle.dart';

class PerDeviceTab extends StatelessWidget {
  const PerDeviceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PerDeviceViewModel>(builder: (context, model, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          pageTitleSubtitle(
              context: context, subtitle2: AppString.perDeviceTitle, subtitle3: AppString.perDeviceDesc),
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
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Visibility(
            visible: model.deviceList.isNotEmpty,
            child: Expanded(
              child: Row(
                children: [
                  const Flexible(
                    flex: 2,
                    child: Card(
                      elevation: 2,
                      child: PerDeviceDatagrid(),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Card(
                      elevation: 2,
                      child: PerDeviceChart(perDeviceList: model.deviceList),
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
