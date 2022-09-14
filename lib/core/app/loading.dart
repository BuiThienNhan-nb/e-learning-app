import 'package:e_learning_app/bases/presentation/atoms/loading_dialog.dart';
import 'package:e_learning_app/core/app/values.dart';
import 'package:flutter/material.dart';

class AppLoading {
  AppLoading._internal();

  static bool isLoading = false;

  static showLoadingDialog() {
    if (!isLoading) {
      showDialog(
        context: AppValues.navigatorKey.currentContext!,
        builder: (_) => const LoadingDialog(),
      );
      isLoading = true;
    }
  }

  static dismissLoadingDialog() {
    if (isLoading) {
      Navigator.of(AppValues.navigatorKey.currentContext!).pop();
      isLoading = false;
    }
  }
}
