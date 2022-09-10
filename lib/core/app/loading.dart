import 'package:e_learning_app/bases/presentation/atoms/loading_dialog.dart';
import 'package:e_learning_app/core/app/values.dart';
import 'package:flutter/material.dart';

class AppLoading {
  AppLoading._internal();

  static showLoadingDialog() => showDialog(
        context: AppValues.navigatorKey.currentContext!,
        builder: (_) => const LoadingDialog(),
      );

  static dismissLoadingDialog() =>
      Navigator.of(AppValues.navigatorKey.currentContext!).pop();
}
