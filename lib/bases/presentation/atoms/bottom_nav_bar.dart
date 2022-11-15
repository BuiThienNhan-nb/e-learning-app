import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../configs/colors.dart';
import '../../../generated/translations/locale_keys.g.dart';
import '../../../utils/nav_bar/nav_bar_item.dart';

@lazySingleton
class BottomNavigationBarConfig {
  final String home = "/home";
  final String explore = "/streaming";
  final String bookmark = "/bookmark";
  final String menu = "/menu";
  late List<String> mainPage = [
    home,
    explore,
    bookmark,
    menu,
  ];

  final GlobalKey<NavigatorState> _section1NavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'section1Nav');
  final GlobalKey<NavigatorState> _section2NavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'section2Nav');
  final GlobalKey<NavigatorState> _section3NavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'section3Nav');
  final GlobalKey<NavigatorState> _section4NavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'section4Nav');
  late final List<ScaffoldWithNavBarTabItem> tabs = [
    ScaffoldWithNavBarTabItem(
      rootRoutePath: mainPage[0],
      navigatorKey: _section1NavigatorKey,
      icon: Image.asset(
        "assets/icons/home_inactive_icon.png",
        color: AppColors.neutral.shade700,
      ),
      label: LocaleKeys.home,
      backgroundColor: AppColors.whiteColor,
      activeIcon: Image.asset(
        "assets/icons/home_active_icon.png",
        color: AppColors.primaryColor,
      ),
    ),
    ScaffoldWithNavBarTabItem(
      rootRoutePath: mainPage[1],
      navigatorKey: _section2NavigatorKey,
      icon: Image.asset(
        "assets/icons/screen_inactive_icon.png",
        color: AppColors.neutral.shade700,
      ),
      label: LocaleKeys.explore,
      backgroundColor: AppColors.whiteColor,
      activeIcon: Image.asset(
        "assets/icons/screen_active_icon.png",
        color: AppColors.primaryColor,
      ),
    ),
    ScaffoldWithNavBarTabItem(
      rootRoutePath: mainPage[2],
      navigatorKey: _section3NavigatorKey,
      icon: Image.asset(
        "assets/icons/my_course_inactive_icon.png",
        color: AppColors.neutral.shade700,
      ),
      label: LocaleKeys.bookmark,
      backgroundColor: AppColors.whiteColor,
      activeIcon: Image.asset(
        "assets/icons/my_course_active_icon.png",
        color: AppColors.primaryColor,
      ),
    ),
    ScaffoldWithNavBarTabItem(
      rootRoutePath: mainPage[3],
      navigatorKey: _section4NavigatorKey,
      icon: Image.asset(
        "assets/icons/menu_inactive_icon.png",
        color: AppColors.neutral.shade700,
      ),
      label: LocaleKeys.menu,
      backgroundColor: AppColors.whiteColor,
      activeIcon: Image.asset(
        "assets/icons/menu_active_icon.png",
        color: AppColors.primaryColor,
      ),
    ),
  ];
}
