import 'package:e_learning_app/configs/colors.dart';
import 'package:flutter/material.dart';

class WAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WAppBar({
    super.key,
    required this.title,
    this.suffixIcon,
    this.height = 56,
    this.bottom,
  });

  final String title;
  final List<Widget>? suffixIcon;
  final double height;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.displaySmall,
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: AppColors.iconLightBasic,
      ),
      actions: suffixIcon,
      elevation: 0,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        bottom == null ? height : height + 32,
      );
}
