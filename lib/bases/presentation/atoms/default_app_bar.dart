import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../configs/colors.dart';
import '../../../configs/dimens.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      titleTextStyle: Theme.of(context).textTheme.displayMedium,
      title: Text(title),
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
