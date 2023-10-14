import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:smart_home/models/per_device_and_date_model.dart';
import 'package:smart_home/style.dart';
import 'package:smart_home/utils/strings.dart';

class PerDeviceChart extends StatelessWidget {
  const PerDeviceChart({required this.perDeviceList, super.key});

  final List<PerDeviceModel> perDeviceList;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      margin: const EdgeInsets.all(16.0),
      title: ChartTitle(text: AppString.perDevice, alignment: ChartAlignment.near),
      primaryXAxis: CategoryAxis(title: AxisTitle(text: AppString.device)),
      primaryYAxis: NumericAxis(title: AxisTitle(text: AppString.perDeviceDataTableHeaderTotalCost)),
      legend: const Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      series: <ChartSeries<PerDeviceChartData, String>>[
        StackedBarSeries<PerDeviceChartData, String>(
          dataSource: getDataForGraph(),
          xValueMapper: (PerDeviceChartData value, _) => value.device,
          yValueMapper: (PerDeviceChartData value, _) => value.units,
          name: AppString.device,
          color: AppColors.chartBlue,
          dataLabelSettings: dataLabelSettings(),
          enableTooltip: true,
        ),
      ],
    );
  }

  List<PerDeviceChartData> getDataForGraph() {
    List<PerDeviceChartData> dataSet = [];

    for (final data in perDeviceList.reversed) {
      dataSet.add(
        PerDeviceChartData(
          data.deviceName ?? 'ERROR',
          data.wattage! * data.usageHours!,
        ),
      );
    }
    return dataSet;
  }

  DataLabelSettings dataLabelSettings() => const DataLabelSettings(
        isVisible: true,
        labelIntersectAction: LabelIntersectAction.shift,
        overflowMode: OverflowMode.none,
        labelPosition: ChartDataLabelPosition.outside,
        textStyle: TextStyle(
          overflow: TextOverflow.visible,
        ),
        useSeriesColor: true,
      );
}

class PerDeviceChartData {
  PerDeviceChartData(
    this.device,
    this.units,
  );
  final String device;
  final int units;
}
