import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../configs/colors.dart';
import '../../../configs/dimens.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: LoadingAnimationWidget.threeRotatingDots(
          color: AppColors.primaryColor,
          size: AppDimens.extraLargeHeightDimens * 2,
        ),
      ),
    );
  }
}
