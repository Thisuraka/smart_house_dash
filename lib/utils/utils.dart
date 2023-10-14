import 'package:flutter/material.dart';
import 'package:smart_home/style.dart';

class Utils {
  static void showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        width: MediaQuery.of(context).size.width * 0.4,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        backgroundColor: AppColors.accentColor,
      ),
    );
  }
}
