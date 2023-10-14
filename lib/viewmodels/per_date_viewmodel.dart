import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:smart_home/models/base_api_response.dart';
import 'package:smart_home/models/per_date_model.dart';
import 'package:smart_home/service/service.dart';
import 'package:smart_home/utils/navigation_service.dart';
import 'package:smart_home/utils/strings.dart';
import 'package:smart_home/utils/urls.dart';
import 'package:smart_home/utils/utils.dart';
import 'package:smart_home/viewmodels/loader_viewmodel.dart';

class PerDateViewModel extends ChangeNotifier {
  final Service service = Service();
  DateTime? startDate;
  DateTime? endDate;
  // DateTime? startDate = DateTime.fromMillisecondsSinceEpoch(1672531200 * 1000);
  // DateTime? endDate = DateTime.fromMillisecondsSinceEpoch(1673541231 * 1000);
  int page = 1;

  List<PerDateModel> dateList = [];

  void process() async {
    dateList = [];
    BuildContext context = NavigationService.navigatorKey.currentState!.context;
    if (startDate == null || endDate == null) {
      Utils.showSnackBar(AppString.selectDate, NavigationService.navigatorKey.currentContext!);
      return;
    }

    Provider.of<LoaderViewmodel>(context, listen: false).updateLoading(true);

    try {
      BaseAPIResponse response = await service.perDateRequest(UrlConstants.getPerDateEndpoint(), {
        'start_date': DateFormat('M/d/y').format(startDate!),
        'end_date': DateFormat('M/d/y').format(endDate!),
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
        dateList = response.data.map<PerDateModel>((data) => PerDateModel.fromJson(data)).toList();

        if (dateList.isEmpty) {
          Utils.showSnackBar(AppString.dataUnavailable, NavigationService.navigatorKey.currentContext!);
          clear();
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

  setDate(DateTime start, DateTime end) {
    startDate = start;
    endDate = end;
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
    dateList = [];
    startDate = null;
    endDate = null;
    notifyListeners();
  }
}
