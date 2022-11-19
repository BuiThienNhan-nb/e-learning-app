import 'package:e_learning_app/configs/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/colors.dart';
import '../../../configs/dimens.dart';

class DefaultTextButton extends StatelessWidget {
  double? height;
  double? width;
  String title = "Submit";
  final Function() submit;
  Color backgroundColor = AppColors.primaryColor;
  TextStyle? titleStyle;

  DefaultTextButton({
    Key? key,
    required this.submit,
    this.title = "Submit",
    this.titleStyle,
    this.height,
    this.width,
    this.backgroundColor = AppColors.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 56.h,
      width: width ?? double.infinity,
      child: TextButton(
        onPressed: submit,
        style: TextButton.styleFrom(
          foregroundColor: AppColors.whiteColor,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.extraItemRadius),
          ),
          shadowColor: AppColors.secondaryColor,
          elevation: 4.w,
        ),
        child: Text(
          title,
          style: titleStyle ?? AppStyles.headline6TextStyle,
        ),
      ),
    );
  }
}
