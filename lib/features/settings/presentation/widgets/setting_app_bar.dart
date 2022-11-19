import 'package:flutter/material.dart';

import '../../../../configs/colors.dart';
import '../../../../configs/styles.dart';

class SettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingAppBar({
    super.key,
    required this.title,
    this.bottom,
  });

  final String title;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: Text(title),
      titleTextStyle: AppStyles.headline5TextStyle.copyWith(
        color: AppColors.blackColor,
        fontWeight: FontWeight.w900,
      ),
      backgroundColor: AppColors.whiteColor,
      bottom: bottom,
      foregroundColor: AppColors.blackColor,
    );
  }

  @override
  Size get preferredSize =>
      bottom == null ? const Size.fromHeight(56) : const Size.fromHeight(104);
}
