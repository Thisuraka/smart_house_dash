import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_home/models/per_date_model.dart';
import 'package:smart_home/utils/calculations.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:smart_home/style.dart';
import 'package:smart_home/utils/strings.dart';

class PerDateChart extends StatelessWidget {
  const PerDateChart({required this.perDateList, super.key});

  final List<PerDateModel> perDateList;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      margin: const EdgeInsets.all(16.0),
      title: ChartTitle(text: AppString.perDevice, alignment: ChartAlignment.near),
      primaryXAxis: CategoryAxis(title: AxisTitle(text: AppString.device)),
      primaryYAxis: NumericAxis(title: AxisTitle(text: AppString.perDeviceDataTableHeaderTotalCost)),
      legend: const Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      series: <ChartSeries<PerDateChartData, String>>[
        StackedBarSeries<PerDateChartData, String>(
          dataSource: getDataForGraph(),
          xValueMapper: (PerDateChartData value, _) => value.device,
          yValueMapper: (PerDateChartData value, _) => value.units,
          name: AppString.device,
          color: AppColors.chartBlue,
          dataLabelSettings: dataLabelSettings(),
          enableTooltip: true,
        ),
      ],
    );
  }

  List<PerDateChartData> getDataForGraph() {
    List<PerDateChartData> dataSet = [];

    for (final data in perDateList.reversed) {
      dataSet.add(
        PerDateChartData(
            DateFormat('yyyy:MM:dd').format(data.date!),
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

class PerDateChartData {
  PerDateChartData(
    this.device,
    this.units,
  );
  final String device;
  final double units;
}
