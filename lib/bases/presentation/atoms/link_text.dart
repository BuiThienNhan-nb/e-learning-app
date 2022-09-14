import 'package:e_learning_app/utils/extensions/context_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/colors.dart';

class LinkText extends StatelessWidget {
  const LinkText({
    Key? key,
    required contentText1,
    required contentText2,
    required onTap1,
    required onTap2,
  })  : _contentText1 = contentText1,
        _contentText2 = contentText2,
        _onTap1 = onTap1,
        _onTap2 = onTap2,
        super(key: key);
  final String _contentText1;
  final String _contentText2;
  final Function() _onTap1;
  final Function() _onTap2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            color: AppColors.blackColor,
          ),
          children: <TextSpan>[
            TextSpan(
              text: _contentText1,
              recognizer: TapGestureRecognizer()..onTap = _onTap1,
            ),
            TextSpan(
              text: _contentText2,
              style: context.textTheme.subtitle1?.copyWith(
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
