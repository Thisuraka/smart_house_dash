import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/models/attack_predict_model.dart';

import 'package:smart_home/models/base_api_response.dart';
import 'package:smart_home/service/service.dart';
import 'package:smart_home/utils/navigation_service.dart';
import 'package:smart_home/utils/strings.dart';
import 'package:smart_home/utils/utils.dart';
import 'package:smart_home/viewmodels/loader_viewmodel.dart';

class PredictionAttackViewModel extends ChangeNotifier {
  final Service service = Service();
  FilePickerResult? pickedFile;

  List<AttackPredictModel> attackPredList = [];

  void process() async {
    Function(int, int)? onSendProgress;
    BuildContext context = NavigationService.navigatorKey.currentState!.context;

    Provider.of<LoaderViewmodel>(context, listen: false).updateLoading(true);
    try {
      BaseAPIResponse response = await service.predictAttackRequest(pickedFile!, onSendProgress);
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
          attackPredList = (jsonMap['data'] as List)
              .map((data) => AttackPredictModel(
                    attack: data['attack'],
                    count: int.tryParse(data['count']) ?? 0,
                  ))
              .toList();
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

  Future pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      withReadStream: true,
      type: FileType.any,
    );
    if (result != null) {
      pickedFile = result;
      process();
    }
  }

  clear() {
    attackPredList = [];
    notifyListeners();
  }

  List sample = [
    {"attack": "DDoS_UDP", "count": "2"},
    {"attack": "XSS", "count": "1"},
    {"attack": "Vulnerability_scanner", "count": "2"},
    {"attack": "Port_Scanning", "count": "2"},
    {"attack": "DDoS_TCP", "count": "3"},
    {"attack": "Backdoor", "count": "1"},
    {"attack": "MITM", "count": "1"},
    {"attack": "Normal", "count": "1"},
    {"attack": "DDoS_HTTP", "count": "2"},
    {"attack": "Password", "count": "1"}
  ];
}
