import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../configs/colors.dart';
import '../../../generated/translations/locale_keys.g.dart';
import '../../../utils/nav_bar/nav_bar_item.dart';

@lazySingleton
class BottomNavigationBarConfig {
  final List<String> mainPage = [
    "/home",
    "/streaming",
    "/enrolled-course",
    "/transactions",
    "/profile",
  ];
  final List<String> iconDataSource = [
    "assets/icons/home_inactive_icon.png",
    "assets/icons/home_active_icon.png",
    "assets/icons/screen_inactive_icon.png",
    "assets/icons/screen_active_icon.png",
    "assets/icons/my_course_inactive_icon.png",
    "assets/icons/my_course_active_icon.png",
    "assets/icons/shopping_cart_inactive_icon.png",
    "assets/icons/shopping_cart_active_icon.png",
    "assets/icons/user_icon.png",
    "assets/icons/user_fill_icon.png",
  ];
  int iconDataSourceIndex = 0;
  final List<GlobalKey<NavigatorState>> keys = [
    GlobalKey<NavigatorState>(debugLabel: 'section1Nav'),
    GlobalKey<NavigatorState>(debugLabel: 'section2Nav'),
    GlobalKey<NavigatorState>(debugLabel: 'section3Nav'),
    GlobalKey<NavigatorState>(debugLabel: 'section4Nav'),
    GlobalKey<NavigatorState>(debugLabel: 'section5Nav'),
  ];

  int keyIndex = 0;

  // Build tabs
  late final List<ScaffoldWithNavBarTabItem> tabs = mainPage
      .map(
        (rootPath) => ScaffoldWithNavBarTabItem(
          rootRoutePath: rootPath,
          navigatorKey: keys[keyIndex++],
          icon: Image.asset(
            iconDataSource[iconDataSourceIndex++],
            color: AppColors.neutral.shade700,
          ),
          label: LocaleKeys.home.tr(),
          backgroundColor: AppColors.whiteColor,
          activeIcon: Image.asset(
            iconDataSource[iconDataSourceIndex++],
            color: AppColors.primaryColor,
          ),
        ),
      )
      .toList();
}
