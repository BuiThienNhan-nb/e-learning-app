import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

const String fontFamily = 'Roboto';

class AppThemes {
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.nunitoSans(
      // fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 45,
      color: AppColors.textLightBasic,
    ),
    displayMedium: GoogleFonts.nunitoSans(
      // // fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: AppColors.textLightBasic,
    ),
    displaySmall: GoogleFonts.nunitoSans(
      // // fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: AppColors.textLightBasic,
    ),
    headlineMedium: GoogleFonts.nunitoSans(
      // // fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 13,
      color: AppColors.textLightBasic,
    ),
    headlineSmall: GoogleFonts.nunitoSans(
      // // fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: AppColors.textLightBasic,
    ),
    titleLarge: GoogleFonts.nunitoSans(
      // // fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      fontSize: 12,
      color: AppColors.textLightBasic,
    ),
    titleMedium: GoogleFonts.nunitoSans(
      // // fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      fontSize: 12,
      color: AppColors.textLightBasic,
    ),
    titleSmall: GoogleFonts.nunitoSans(
      // // fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      fontSize: 10,
      color: AppColors.textLightBasic,
    ),
    bodyLarge: GoogleFonts.nunitoSans(
      // // fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      fontSize: 9,
      color: AppColors.textLightBasic,
    ),
    bodyMedium: GoogleFonts.nunitoSans(
      // // fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      fontSize: 9,
      color: AppColors.textLightBasic,
    ),
    bodySmall: GoogleFonts.nunitoSans(
      // // fontFamily: fontFamily,
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
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.nunitoSans(
        fontSize: 13,
        fontWeight: FontWeight.w300,
        color: AppColors.textGray999,
      ),
    ),
    textTheme: lightTextTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
