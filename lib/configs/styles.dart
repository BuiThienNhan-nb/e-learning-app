import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dimens.dart';

class AppStyles {
  AppStyles._internal();

  /// Text styles
  static final TextStyle headline1TextStyle = GoogleFonts.nunitoSans(
    fontSize: AppDimens.headline1Text,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle headline2TextStyle = GoogleFonts.nunitoSans(
    fontSize: AppDimens.headline2Text,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle headline3TextStyle = GoogleFonts.nunitoSans(
    fontSize: AppDimens.headline3Text,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle headline4TextStyle = GoogleFonts.nunitoSans(
    fontSize: AppDimens.headline4Text,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle headline5TextStyle = GoogleFonts.nunitoSans(
    fontSize: AppDimens.headline5Text,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle headline6TextStyle = GoogleFonts.nunitoSans(
    fontSize: AppDimens.headline6Text,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle subtitle1TextStyle = GoogleFonts.nunitoSans(
    fontSize: AppDimens.subtitle1Text,
    fontWeight: FontWeight.w300,
  );

  static final TextStyle subtitle2TextStyle = GoogleFonts.nunitoSans(
    fontSize: AppDimens.subtitle2Text,
    fontWeight: FontWeight.w300,
  );

  static const FontWeight extraLight = FontWeight.w300;
  static const FontWeight light = FontWeight.w400;
  static const FontWeight bold = FontWeight.bold;
  static const FontWeight extraBold = FontWeight.w900;
  static const FontWeight normal = FontWeight.normal;
}
