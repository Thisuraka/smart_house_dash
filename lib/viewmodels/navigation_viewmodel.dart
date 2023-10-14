import 'package:flutter/material.dart';

class NavigationViewModel extends ChangeNotifier {
  int selectedIndex = 0;

  updateIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
