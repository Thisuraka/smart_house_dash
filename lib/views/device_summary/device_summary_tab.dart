import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_home/utils/strings.dart';
import 'package:smart_home/viewmodels/device_summary_viewmodel.dart';
import 'package:smart_home/views/device_summary/device_summary_chart.dart';
import 'package:smart_home/views/device_summary/device_summary_datagrid.dart';
import 'package:smart_home/widgets/page_title_subtitle.dart';

class DeviceSummaryTab extends StatelessWidget {
  const DeviceSummaryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DeviceSummaryViewModel>(builder: (context, model, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          pageTitleSubtitle(
              context: context,
              subtitle2: AppString.deviceSummaryTitle,
              subtitle3: AppString.deviceSummaryDesc),
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
                      child: DeviceSummaryDatagrid(),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Card(
                      elevation: 2,
                      child: DeviceSummaryChart(deviceList: model.deviceList),
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
