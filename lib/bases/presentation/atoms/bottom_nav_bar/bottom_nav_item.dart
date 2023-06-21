import 'package:flutter/material.dart';

import 'active_nav_item.dart';
import 'inactive_nav_item.dart';

class BtmNavItem extends StatelessWidget {
  const BtmNavItem(
      {Key? key,
      required this.btnName,
      required this.iconPath,
      required this.isActive,
      this.defaultIconColor = '#222222'})
      : super(key: key);
  final String btnName;
  final String iconPath;
  final bool isActive;
  final String defaultIconColor;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? NavActiveItem(
            key,
            iconPath: iconPath,
            defaultIconColor: defaultIconColor,
          )
        : NavInactiveItem(
            key,
            btnName,
            iconPath: iconPath,
            defaultIconColor: defaultIconColor,
          );
  }
}
