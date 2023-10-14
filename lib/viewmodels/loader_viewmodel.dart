import 'package:flutter/material.dart';

class LoaderViewmodel extends ChangeNotifier {
  bool isLoading = false;

  updateLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }
}
