import 'package:e_learning_app/configs/colors.dart';
import 'package:flutter/material.dart';

import '../primary_icon.dart';
import 'base_nav_item.dart';

class NavActiveItem extends BaseNavItem {
  NavActiveItem(
    Key? key, {
    required String iconPath,
    required String defaultIconColor,
  }) : super(
          key: key,
          iconPath: iconPath,
          defaultIconColor: defaultIconColor,
        );

  final BoxShadow _boxShadow = BoxShadow(
    offset: const Offset(0, 20),
    blurRadius: 20,
    color: const Color(0x00000000).withOpacity(0.2),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: itemHeight,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.iconActive,
        boxShadow: [_boxShadow],
      ),
      child: Center(
        child: SizedBox(
          height: 20,
          width: 21,
          child: PrimaryIcon(
            defaultColor: defaultIconColor,
            icon: iconPath,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
