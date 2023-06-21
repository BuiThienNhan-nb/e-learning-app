import 'package:flutter/material.dart';

import 'colors.dart';

const String fontFamily = 'Roboto';

class AppThemes {
  static TextTheme lightTextTheme = const TextTheme(
    displayLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 45,
      color: AppColors.textLightBasic,
    ),
    displayMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: AppColors.textLightBasic,
    ),
    displaySmall: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: AppColors.textLightBasic,
    ),
    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 13,
      color: AppColors.textLightBasic,
    ),
    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: AppColors.textLightBasic,
    ),
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      fontSize: 12,
      color: AppColors.textLightBasic,
    ),
    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      fontSize: 12,
      color: AppColors.textLightBasic,
    ),
    titleSmall: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      fontSize: 10,
      color: AppColors.textLightBasic,
    ),
    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      fontSize: 9,
      color: AppColors.textLightBasic,
    ),
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      fontSize: 9,
      color: AppColors.textLightBasic,
    ),
    bodySmall: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      fontSize: 9,
      color: AppColors.textLightBasic,
    ),
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.appColorBlue,
    scaffoldBackgroundColor: AppColors.backgroundLightMode,
    appBarTheme: const AppBarTheme(color: AppColors.backgroundLightMode),
    bottomAppBarTheme:
        const BottomAppBarTheme(color: AppColors.backgroundLightMode),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w300,
          color: AppColors.textGray999),
    ),
    textTheme: lightTextTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
