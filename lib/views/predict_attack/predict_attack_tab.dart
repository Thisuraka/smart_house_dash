import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_home/style.dart';
import 'package:smart_home/utils/strings.dart';
import 'package:smart_home/viewmodels/predict_attack_viewmodel.dart';
import 'package:smart_home/views/predict_attack/attack_chart.dart';
import 'package:smart_home/widgets/page_title_subtitle.dart';

class PredictAttackTab extends StatelessWidget {
  const PredictAttackTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PredictionAttackViewModel>(builder: (context, model, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          pageTitleSubtitle(
              context: context,
              subtitle2: AppString.attackPredictionTitle2,
              subtitle3: AppString.attackPredictionDesc),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(AppString.attackPredictionUpload),
              IconButton(
                onPressed: () {
                  model.pickFile();
                },
                icon: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.defaultColor,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Icon(
                    Icons.upload_file,
                    color: Colors.white,
                  ),
                ),
              ),
              Visibility(
                visible: model.pickedFile != null,
                child: Text(model.pickedFile != null ? model.pickedFile!.files.first.name : ""),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Visibility(
            visible: model.attackPredList.isNotEmpty,
            child: Expanded(
              child: Flexible(
                flex: 2,
                child: Card(
                  elevation: 2,
                  child: AttackChart(dataList: model.attackPredList),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
