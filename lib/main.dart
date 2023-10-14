import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/utils/navigation_service.dart';
import 'package:smart_home/viewmodels/navigation_viewmodel.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smart_home/views/home_view.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: ((context) => NavigationViewModel()),
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
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      theme: ThemeData(
        fontFamily: 'CaviarDreams',
        useMaterial3: true,
      ),
      home: const HomeView(),
      builder: EasyLoading.init(),
    );
  }
}
