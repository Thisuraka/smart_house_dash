import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/style.dart';
import 'package:smart_home/utils/assets.dart';
import 'package:smart_home/utils/strings.dart';
import 'package:smart_home/viewmodels/loader_viewmodel.dart';
import 'package:smart_home/viewmodels/navigation_viewmodel.dart';
import 'package:smart_home/views/device_summary/device_summary_tab.dart';
import 'package:smart_home/views/electricity_consumption/consumption_tab.dart';
import 'package:smart_home/views/month_prediction/month_prediction_tab.dart';
import 'package:smart_home/views/per_date/per_date_tab.dart';
import 'package:smart_home/views/per_device/per_device_tab.dart';
import 'package:smart_home/views/predict_attack/predict_attack_tab.dart';
import 'package:smart_home/widgets/loader_overlay.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: AppColors.defaultColor,
        title: Align(
          alignment: Alignment.center,
          child: Image.asset(
            AppAssets.logoWithText,
            fit: BoxFit.fitHeight,
            height: 80,
          ),
        ),
      ),
      body: LoaderOverlay(
        isLoading: Provider.of<LoaderViewmodel>(context, listen: true).isLoading,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Consumer<NavigationViewModel>(
            builder: (context, model, child) {
              return Row(
                children: <Widget>[
                  NavigationRail(
                    selectedIndex: model.selectedIndex,
                    groupAlignment: -1.0,
                    elevation: 1,
                    backgroundColor: AppColors.defaultColor,
                    indicatorColor: AppColors.accentColor,
                    onDestinationSelected: (int index) {
                      model.updateIndex(index);
                    },
                    labelType: NavigationRailLabelType.all,
                    destinations: const <NavigationRailDestination>[
                      NavigationRailDestination(
                        icon: Icon(Icons.devices_fold, color: Colors.white),
                        label: Text(AppString.perDevice),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.calendar_month_rounded, color: Colors.white),
                        label: Text(AppString.perDay),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.device_hub, color: Colors.white),
                        label: Text(AppString.deviceSummary),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.electrical_services_rounded, color: Colors.white),
                        label: Text(AppString.consumptionSummary),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.electric_bolt_outlined, color: Colors.white),
                        label: Text(
                          AppString.consumptionPredictionTitle1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.blur_circular, color: Colors.white),
                        label: Text(
                          AppString.attackPredictionTitle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const VerticalDivider(thickness: 1, width: 1, color: Colors.black12),
                  if (model.selectedIndex == 0)
                    Expanded(
                      child: Container(
                          color: AppColors.bodyColor,
                          padding: const EdgeInsets.all(20),
                          child: const PerDeviceTab()),
                    ),
                  if (model.selectedIndex == 1)
                    Expanded(
                      child: Container(
                          color: AppColors.bodyColor,
                          padding: const EdgeInsets.all(20),
                          child: const PerDateTab()),
                    ),
                  if (model.selectedIndex == 2)
                    Expanded(
                      child: Container(
                        color: AppColors.bodyColor,
                        padding: const EdgeInsets.all(20),
                        child: const DeviceSummaryTab(),
                      ),
                    ),
                  if (model.selectedIndex == 3)
                    Expanded(
                      child: Container(
                        color: AppColors.bodyColor,
                        padding: const EdgeInsets.all(20),
                        child: const ConsumptionTab(),
                      ),
                    ),
                  if (model.selectedIndex == 4)
                    Expanded(
                      child: Container(
                        color: AppColors.bodyColor,
                        padding: const EdgeInsets.all(20),
                        child: const ConsumptionPredictionTab(),
                      ),
                    ),
                  if (model.selectedIndex == 5)
                    Expanded(
                      child: Container(
                        color: AppColors.bodyColor,
                        padding: const EdgeInsets.all(20),
                        child: const PredictAttackTab(),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
