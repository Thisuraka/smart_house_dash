import 'package:flutter/material.dart';
import 'package:smart_home/models/device_smmary.dart';
import 'package:smart_home/utils/calculations.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:smart_home/style.dart';
import 'package:smart_home/utils/strings.dart';

class DeviceSummaryChart extends StatelessWidget {
  const DeviceSummaryChart({required this.deviceList, super.key});

  final List<DeviceSummaryModel> deviceList;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      margin: const EdgeInsets.all(16.0),
      title: ChartTitle(text: AppString.perDevice, alignment: ChartAlignment.near),
      primaryXAxis: CategoryAxis(title: AxisTitle(text: AppString.device)),
      primaryYAxis: NumericAxis(title: AxisTitle(text: AppString.perDeviceDataTableHeaderTotalCost)),
      legend: const Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      series: <ChartSeries<DeviceSummaryChartData, String>>[
        StackedBarSeries<DeviceSummaryChartData, String>(
          dataSource: getDataForGraph(),
          xValueMapper: (DeviceSummaryChartData value, _) => value.device,
          yValueMapper: (DeviceSummaryChartData value, _) => value.units,
          name: AppString.device,
          color: AppColors.chartBlue,
          dataLabelSettings: dataLabelSettings(),
          enableTooltip: true,
        ),
      ],
    );
  }

  List<DeviceSummaryChartData> getDataForGraph() {
    List<DeviceSummaryChartData> dataSet = [];

    for (final data in deviceList.reversed) {
      dataSet.add(
        DeviceSummaryChartData(
            data.deviceName ?? 'ERROR',
            Calculations.getTotalCost(Calculations.getCostPerKwh(data.costPerKwh!),
                Calculations.getWattage(data.wattage!), data.usageHours!)),
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

class DeviceSummaryChartData {
  DeviceSummaryChartData(
    this.device,
    this.units,
  );
  final String device;
  final double units;
}
