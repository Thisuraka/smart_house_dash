import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/utils/navigation_service.dart';
import 'package:smart_home/viewmodels/sign_in_up_viewmodel.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: ((context) => SignInUpViewModel()),
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
        primarySwatch: Colors.blue,
      ),
      home: Container(),
      builder: EasyLoading.init(),
    );
  }
}
