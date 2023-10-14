import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/style.dart';
import 'package:smart_home/utils/assets.dart';
import 'package:smart_home/utils/strings.dart';
import 'package:smart_home/viewmodels/navigation_viewmodel.dart';
import 'package:smart_home/viewmodels/per_device_viewmodel.dart';
import 'package:smart_home/views/per_device/per_device_tab.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: defaultColor,
        title: Align(
          alignment: Alignment.center,
          child: Image.asset(
            AppAssets.logoWithText,
            fit: BoxFit.fitHeight,
            height: 80,
          ),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Consumer<NavigationViewModel>(
          builder: (context, model, child) {
            return Row(
              children: <Widget>[
                NavigationRail(
                  selectedIndex: model.selectedIndex,
                  groupAlignment: 0,
                  onDestinationSelected: (int index) {
                    model.updateIndex(index);
                  },
                  labelType: NavigationRailLabelType.all,
                  destinations: const <NavigationRailDestination>[
                    NavigationRailDestination(
                      icon: Icon(Icons.devices_fold),
                      label: Text(AppString.perDevice),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.circle),
                      label: Text('Set here'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.circle),
                      label: Text('Set here'),
                    ),
                  ],
                ),
                const VerticalDivider(thickness: 1, width: 1, color: Colors.black12),
                if (model.selectedIndex == 0)
                  Expanded(
                    child: Container(
                      color: Colors.black12,
                      child: ChangeNotifierProvider(
                        create: (context) => PerDeviceViewModel(),
                        child: const PerDeviceTab(),
                      ),
                    ),
                  ),
                if (model.selectedIndex == 1)
                  Expanded(
                    child: Container(
                      color: Colors.black12,
                    ),
                  ),
                if (model.selectedIndex == 2)
                  Expanded(
                    child: Container(
                      color: Colors.black12,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
