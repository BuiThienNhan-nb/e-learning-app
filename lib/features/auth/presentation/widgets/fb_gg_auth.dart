import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../state/provider/auth_page_provider.dart';

class SocialAuthentication extends StatelessWidget {
  const SocialAuthentication({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final AuthPageProvider provider;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 80.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(AppDimens.itemRadius),
              border: Border.all(color: AppColors.neutral.shade400),
            ),
            child: Center(
              child: SvgPicture.asset("assets/icons/facebook_icon.svg"),
            ),
          ),
          Container(
            width: 80.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(AppDimens.itemRadius),
              border: Border.all(color: AppColors.neutral.shade400),
            ),
            child: Center(
              child: SvgPicture.asset("assets/icons/google_icon.svg"),
            ),
          ),
        ],
      ),
    );
  }
}
