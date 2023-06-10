import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class Utils {
  Utils._internal();

  static Utils instance = Utils._internal();

  // Dimensions
  Offset? getWidgetOffset(GlobalKey key) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.localToGlobal(Offset.zero);
  }

  Size? getWidgetSize(GlobalKey key) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    final Size? size = renderBox?.size;
    return size;
  }

  double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).viewPadding.top +
        (Platform.isAndroid ? 10 : 0);
  }

  TValue widgetCase<TOptionType, TValue>(
    TOptionType selectedOption,
    Map<TOptionType, TValue> branches,
    TValue defaultValue,
  ) {
    return branches[selectedOption] ?? defaultValue;
  }
}
