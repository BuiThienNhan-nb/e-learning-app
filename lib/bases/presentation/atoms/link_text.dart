import 'package:e_learning_app/utils/extensions/context_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/colors.dart';

class LinkText extends StatelessWidget {
  LinkText({
    Key? key,
    required contentText1,
    required contentText2,
    required onTap1,
    required onTap2,
    this.text1Style,
    this.text2Style,
    this.topPadding,
    this.textAlign,
  })  : _contentText1 = contentText1,
        _contentText2 = contentText2,
        _onTap1 = onTap1,
        _onTap2 = onTap2,
        super(key: key);
  final String _contentText1;
  final String _contentText2;
  final Function() _onTap1;
  final Function() _onTap2;
  TextStyle? text1Style;
  TextStyle? text2Style;
  double? topPadding;
  TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding ?? 10.h),
      child: RichText(
        textAlign: textAlign ?? TextAlign.center,
        text: TextSpan(
          style: const TextStyle(
            color: AppColors.blackColor,
          ),
          children: <TextSpan>[
            TextSpan(
              text: _contentText1,
              style: text1Style,
              recognizer: TapGestureRecognizer()..onTap = _onTap1,
            ),
            TextSpan(
              text: _contentText2,
              style: text2Style ??
                  context.textTheme.subtitle1?.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
              recognizer: TapGestureRecognizer()..onTap = _onTap2,
            ),
          ],
        ),
      ),
    );
  }
}
