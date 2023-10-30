import 'package:flutter/material.dart';
import 'package:smart_home/models/attack_predict_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AttackChart extends StatelessWidget {
  final List<AttackPredictModel> dataList;

  const AttackChart({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      series: <PieSeries<AttackPredictModel, String>>[
        PieSeries<AttackPredictModel, String>(
          dataSource: dataList,
          xValueMapper: (AttackPredictModel data, _) => data.attack,
          yValueMapper: (AttackPredictModel data, _) => data.count,
          dataLabelMapper: (AttackPredictModel data, _) =>
              '${data.attack} - ${data.count}',
          startAngle: 90,
          endAngle: 90,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    );
  
  }
}
