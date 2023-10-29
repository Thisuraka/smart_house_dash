import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:smart_home/models/base_api_response.dart';
import 'package:smart_home/models/month_prediction_model.dart';
import 'package:smart_home/service/service.dart';
import 'package:smart_home/utils/navigation_service.dart';
import 'package:smart_home/utils/strings.dart';
import 'package:smart_home/utils/utils.dart';
import 'package:smart_home/viewmodels/loader_viewmodel.dart';

class ConsumptionPredictionViewModel extends ChangeNotifier {
  final Service service = Service();

  List<MonthPredictionModel> consumptionPredList = [];
  TextEditingController predictTillController = TextEditingController();

  void process() async {
    BuildContext context = NavigationService.navigatorKey.currentState!.context;

    if (predictTillController.text == '') {
      Utils.showSnackBar(AppString.invalidInput, NavigationService.navigatorKey.currentContext!);
      return;
    } else {
      if (int.parse(predictTillController.text) <= 0) {
        Provider.of<LoaderViewmodel>(context, listen: false).updateLoading(false);
        Utils.showSnackBar(AppString.invalidInput, NavigationService.navigatorKey.currentContext!);
        return;
      }
    }

    Provider.of<LoaderViewmodel>(context, listen: false).updateLoading(true);
    try {
      BaseAPIResponse response =
          await service.consumptionPredictionRequest({"pred_till": int.parse(predictTillController.text)});
      if (response.error) {
        if (context.mounted) {
          Provider.of<LoaderViewmodel>(context, listen: false).updateLoading(false);
        }
        Utils.showSnackBar(AppString.somethingWentWrong, NavigationService.navigatorKey.currentContext!);
      } else {
        if (context.mounted) {
          Provider.of<LoaderViewmodel>(context, listen: false).updateLoading(false);
        }
        if (response.data == null) {
          Utils.showSnackBar(AppString.noData, NavigationService.navigatorKey.currentContext!);
        } else {
          Map<String, dynamic> jsonMap = json.decode(response.data);

          consumptionPredList = jsonMap.entries.map((entry) {
            int timestamp = int.tryParse(entry.key) ?? 0;
            double value = entry.value?.toDouble() ?? 0.0;
            return MonthPredictionModel(timestamp: timestamp, value: value);
          }).toList();
        }
      }
    } catch (e) {
      if (context.mounted) {
        Provider.of<LoaderViewmodel>(context, listen: false).updateLoading(false);
      }
      Utils.showSnackBar(AppString.somethingWentWrong, NavigationService.navigatorKey.currentContext!);
    }

    notifyListeners();
  }

  clear() {
    consumptionPredList = [];
    notifyListeners();
  }
}
