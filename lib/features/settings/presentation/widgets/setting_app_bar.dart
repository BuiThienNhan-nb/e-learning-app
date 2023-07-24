import 'package:flutter/material.dart';

import '../../../../configs/colors.dart';

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
      titleTextStyle: Theme.of(context).textTheme.displayMedium,
      backgroundColor: AppColors.whiteColor,
      bottom: bottom,
      foregroundColor: AppColors.blackColor,
    );
  }

  @override
  Size get preferredSize =>
      bottom == null ? const Size.fromHeight(56) : const Size.fromHeight(104);
}
