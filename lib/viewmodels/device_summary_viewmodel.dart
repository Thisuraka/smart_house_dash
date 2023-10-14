import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_home/models/base_api_response.dart';
import 'package:smart_home/models/device_smmary.dart';
import 'package:smart_home/service/service.dart';
import 'package:smart_home/utils/navigation_service.dart';
import 'package:smart_home/utils/strings.dart';
import 'package:smart_home/utils/urls.dart';
import 'package:smart_home/utils/utils.dart';
import 'package:smart_home/viewmodels/loader_viewmodel.dart';

class DeviceSummaryViewModel extends ChangeNotifier {
  final Service service = Service();

  List<DeviceSummaryModel> deviceList = [];

  void process() async {
    deviceList = [];
    BuildContext context = NavigationService.navigatorKey.currentState!.context;

    Provider.of<LoaderViewmodel>(context, listen: false).updateLoading(true);

    try {
      BaseAPIResponse response = await service.deviceSummaryRequest(UrlConstants.getDeviceSummaryEndpoint());
      if (response.error) {
        if (context.mounted) {
          Provider.of<LoaderViewmodel>(context, listen: false).updateLoading(false);
        }
        Utils.showSnackBar(AppString.somethingWentWrong, NavigationService.navigatorKey.currentContext!);
      } else {
        if (context.mounted) {
          Provider.of<LoaderViewmodel>(context, listen: false).updateLoading(false);
        }
        deviceList =
            response.data.map<DeviceSummaryModel>((data) => DeviceSummaryModel.fromJson(data)).toList();
      }
    } catch (e) {
      if (context.mounted) {
        Provider.of<LoaderViewmodel>(context, listen: false).updateLoading(false);
      }
      Utils.showSnackBar(AppString.somethingWentWrong, NavigationService.navigatorKey.currentContext!);
    }
    notifyListeners();
  }

  clear() {}
}
