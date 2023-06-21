import 'package:flutter/material.dart';

import '../primary_icon.dart';
import 'base_nav_item.dart';

class NavInactiveItem extends BaseNavItem {
  const NavInactiveItem(
    Key? key,
    this._label, {
    required String iconPath,
    required String defaultIconColor,
  }) : super(
          key: key,
          iconPath: iconPath,
          defaultIconColor: defaultIconColor,
        );
  final String _label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemHeight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Center(
                child: SizedBox(
                  height: 20,
                  width: 21,
                  child: PrimaryIcon(
                    defaultColor: defaultIconColor,
                    icon: iconPath,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Text(
            _label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
