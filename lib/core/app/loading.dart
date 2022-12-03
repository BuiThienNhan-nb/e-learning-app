import 'package:e_learning_app/bases/presentation/atoms/loading_dialog.dart';
import 'package:flutter/material.dart';

class AppLoading {
  AppLoading._internal();

  static bool isLoading = false;

  static showLoadingDialog(BuildContext context) {
    if (!isLoading) {
      showDialog(
        context: context,
        builder: (_) => const LoadingDialog(),
        barrierDismissible: false,
      );
      isLoading = true;
    }
  }

  static dismissLoadingDialog(BuildContext context) {
    if (isLoading) {
      Navigator.of(context, rootNavigator: true).pop();
      isLoading = false;
    }
  }
}
