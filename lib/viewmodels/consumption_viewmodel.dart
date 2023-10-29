import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:smart_home/models/base_api_response.dart';
import 'package:smart_home/models/consumption_model.dart';
import 'package:smart_home/service/service.dart';
import 'package:smart_home/utils/navigation_service.dart';
import 'package:smart_home/utils/strings.dart';
import 'package:smart_home/utils/utils.dart';
import 'package:smart_home/viewmodels/loader_viewmodel.dart';

class ConsumptionViewModel extends ChangeNotifier {
  final Service service = Service();
  DateTime? pickedDate;

  ElectricityConsumptionModel? consumptionModel;

  void process() async {
    BuildContext context = NavigationService.navigatorKey.currentState!.context;

    Provider.of<LoaderViewmodel>(context, listen: false).updateLoading(true);

    try {
      BaseAPIResponse response =
          await service.consumptionRequest({'date': DateFormat('M/d/y').format(pickedDate!)});
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
          Utils.showSnackBar(AppString.noDataPickMonth, NavigationService.navigatorKey.currentContext!);
        } else {
          consumptionModel = ElectricityConsumptionModel.fromJson(response.data);
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

  setDate(DateTime date) {
    pickedDate = date;
    notifyListeners();
  }

  clear() {
    consumptionModel = null;
    pickedDate = null;
    notifyListeners();
  }
}
