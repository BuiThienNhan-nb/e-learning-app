import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../configs/colors.dart';
import '../../../generated/translations/locale_keys.g.dart';
import '../../../utils/nav_bar/nav_bar_item.dart';

@lazySingleton
class BottomNavigationBarConfig {
  final String home = "/home";
  final String explore = "/streaming";
  final String bookmark = "/my-course";
  final String transactions = "/transactions";
  final String profile = "/profile";
  final List<String> mainPage = [
    "/home",
    "/streaming",
    "/my-course",
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
  // final GlobalKey<NavigatorState> _section1NavigatorKey =
  //     GlobalKey<NavigatorState>(debugLabel: 'section1Nav');
  // final GlobalKey<NavigatorState> _section2NavigatorKey =
  //     GlobalKey<NavigatorState>(debugLabel: 'section2Nav');
  // final GlobalKey<NavigatorState> _section3NavigatorKey =
  //     GlobalKey<NavigatorState>(debugLabel: 'section3Nav');
  // final GlobalKey<NavigatorState> _section4NavigatorKey =
  //     GlobalKey<NavigatorState>(debugLabel: 'section4Nav');
  // final GlobalKey<NavigatorState> _section5NavigatorKey =
  //     GlobalKey<NavigatorState>(debugLabel: 'section5Nav');
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

  // [
  //   ScaffoldWithNavBarTabItem(
  //     rootRoutePath = mainPage[0],
  //     navigatorKey = _section1NavigatorKey,
  //     icon = Image.asset(
  //       "assets/icons/home_inactive_icon.png",
  //       color: AppColors.neutral.shade700,
  //     ),
  //     label = LocaleKeys.home,
  //     backgroundColor = AppColors.whiteColor,
  //     activeIcon = Image.asset(
  //       "assets/icons/home_active_icon.png",
  //       color: AppColors.primaryColor,
  //     ),
  //   ),
  //   ScaffoldWithNavBarTabItem(
  //     rootRoutePath = mainPage[1],
  //     navigatorKey = _section2NavigatorKey,
  //     icon = Image.asset(
  //       "assets/icons/screen_inactive_icon.png",
  //       color: AppColors.neutral.shade700,
  //     ),
  //     label = LocaleKeys.explore,
  //     backgroundColor = AppColors.whiteColor,
  //     activeIcon = Image.asset(
  //       "assets/icons/screen_active_icon.png",
  //       color: AppColors.primaryColor,
  //     ),
  //   ),
  //   ScaffoldWithNavBarTabItem(
  //     rootRoutePath = mainPage[2],
  //     navigatorKey = _section3NavigatorKey,
  //     icon = Image.asset(
  //       "assets/icons/my_course_inactive_icon.png",
  //       color: AppColors.neutral.shade700,
  //     ),
  //     label = LocaleKeys.bookmark,
  //     backgroundColor = AppColors.whiteColor,
  //     activeIcon = Image.asset(
  //       "assets/icons/my_course_active_icon.png",
  //       color: AppColors.primaryColor,
  //     ),
  //   ),
  //   ScaffoldWithNavBarTabItem(
  //     rootRoutePath = mainPage[4],
  //     navigatorKey = _section5NavigatorKey,
  //     icon = Image.asset(
  //       "assets/icons/user_icon.png",
  //       color: AppColors.neutral.shade700,
  //     ),
  //     label = LocaleKeys.profile,
  //     backgroundColor = AppColors.whiteColor,
  //     activeIcon = Image.asset(
  //       "assets/icons/user_fill_icon.png",
  //       color: AppColors.primaryColor,
  //     ),
  //   ),
  // ];
}
