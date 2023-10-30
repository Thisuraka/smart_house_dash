import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/utils/navigation_service.dart';
import 'package:smart_home/viewmodels/device_summary_viewmodel.dart';

class NavigationViewModel extends ChangeNotifier {
  int selectedIndex = 0;

  updateIndex(int index) {
    selectedIndex = index;
    if (selectedIndex == 2) {
      Provider.of<DeviceSummaryViewModel>(NavigationService.navigatorKey.currentState!.context, listen: false)
          .process();
    }

    notifyListeners();
  }
}
