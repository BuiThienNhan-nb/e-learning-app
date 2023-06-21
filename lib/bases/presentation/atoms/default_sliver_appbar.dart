import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../configs/colors.dart';
import '../../../configs/dimens.dart';
import '../../../configs/styles.dart';

class DefaultSliverAppBar extends StatelessWidget {
  const DefaultSliverAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      leading: Container(
        margin: EdgeInsets.all(AppDimens.mediumWidthDimens),
        padding: EdgeInsets.all(AppDimens.mediumWidthDimens),
        decoration: BoxDecoration(
          color: AppColors.appColorBlue,
          borderRadius: BorderRadius.circular(AppDimens.largeRadius),
        ),
        child: SvgPicture.asset(
          "assets/images/app_logo.svg",
          color: AppColors.whiteColor,
          fit: BoxFit.scaleDown,
        ),
      ),
      titleTextStyle: AppStyles.headline5TextStyle.copyWith(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w900,
      ),
      title: Text(title),
      backgroundColor: AppColors.whiteColor,
    );
  }
}
