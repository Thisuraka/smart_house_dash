import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:smart_home/style.dart';
import 'package:smart_home/utils/strings.dart';

class LoaderOverlay extends StatelessWidget {
  const LoaderOverlay({
    required this.isLoading,
    required this.child,
    Key? key,
  }) : super(key: key);

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      color: Colors.white,
      progressIndicator: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: AppColors.defaultColor),
          const SizedBox(
            height: 10,
          ),
          const Text(
            AppString.loading,
            style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      child: child,
    );
  }
}
