import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
              context: context,
              subtitle2: AppString.perDeviceTitle,
              subtitle3: AppString.perDeviceDesc),
          DateFilterWidget(
            selectedDates: (DateTime startDate, DateTime endDate) {
              model.setStartAndEndDate(startDate, endDate);
            },
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Row(
              children: [
                const Flexible(
                  flex: 1,
                  child: Card(
                    elevation: 2,
                    child: PerDeviceDatagrid(),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Card(
                    elevation: 2,
                    child: PerDeviceChart(perDeviceList: model.sampleData),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
