import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/utils/navigation_service.dart';
import 'package:smart_home/viewmodels/consumption_viewmodel.dart';
import 'package:smart_home/viewmodels/device_summary_viewmodel.dart';
import 'package:smart_home/viewmodels/loader_viewmodel.dart';
import 'package:smart_home/viewmodels/navigation_viewmodel.dart';
import 'package:smart_home/viewmodels/per_date_viewmodel.dart';
import 'package:smart_home/viewmodels/per_device_viewmodel.dart';
import 'package:smart_home/views/home_view.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: ((context) => NavigationViewModel()),
      ),
      ChangeNotifierProvider(
        create: ((context) => DeviceSummaryViewModel()),
      ),
      ChangeNotifierProvider(
        create: ((context) => PerDeviceViewModel()),
      ),
      ChangeNotifierProvider(
        create: ((context) => PerDateViewModel()),
      ),
      ChangeNotifierProvider(
        create: ((context) => ConsumptionViewModel()),
      ),
      ChangeNotifierProvider(
        create: ((context) => LoaderViewmodel()),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "EnerGz",
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      theme: ThemeData(
        fontFamily: 'CaviarDreams',
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
