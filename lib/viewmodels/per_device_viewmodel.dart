import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:smart_home/models/base_api_response.dart';
import 'package:smart_home/models/per_device_model.dart';
import 'package:smart_home/service/service.dart';
import 'package:smart_home/utils/navigation_service.dart';
import 'package:smart_home/utils/strings.dart';
import 'package:smart_home/utils/urls.dart';
import 'package:smart_home/utils/utils.dart';
import 'package:smart_home/viewmodels/loader_viewmodel.dart';

class PerDeviceViewModel extends ChangeNotifier {
  final Service service = Service();
  // DateTime? pickedDate = DateTime.fromMillisecondsSinceEpoch(1672531200 * 1000);
  DateTime? pickedDate;
  int page = 1;

  List<PerDeviceModel> deviceList = [];

  void process() async {
    deviceList = [];
    BuildContext context = NavigationService.navigatorKey.currentState!.context;
    if (pickedDate == null) {
      Utils.showSnackBar(AppString.selectDate, NavigationService.navigatorKey.currentContext!);
      return;
    }

    Provider.of<LoaderViewmodel>(context, listen: false).updateLoading(true);

    try {
      BaseAPIResponse response =
          await service.perDeviceAndDateRequest( {
        'date': DateFormat('M/d/y').format(pickedDate!),
        'page': page,
      });
      if (response.error) {
        if (context.mounted) {
          Provider.of<LoaderViewmodel>(context, listen: false).updateLoading(false);
        }
        Utils.showSnackBar(AppString.somethingWentWrong, NavigationService.navigatorKey.currentContext!);
      } else {
        if (context.mounted) {
          Provider.of<LoaderViewmodel>(context, listen: false).updateLoading(false);
        }
        deviceList = response.data.map<PerDeviceModel>((data) => PerDeviceModel.fromJson(data)).toList();
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

  updatePageNumber({bool reset = false}) {
    if (reset) {
      page = 1;
    } else {
      page++;
    }
    notifyListeners();
  }

  clear() {
    updatePageNumber(reset: true);
    deviceList = [];
    pickedDate = null;
    notifyListeners();
  }
}
