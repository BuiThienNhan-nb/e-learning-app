import 'package:flutter/material.dart';

class AppLanguages {
  AppLanguages._internal();

  static const List<Locale> supportedLocales = [
    Locale('vi'),
    Locale('en'),
  ];

  static Locale fallbackLocale = supportedLocales.first;

  static String? defaultLocaleString = supportedLocales.first.countryCode;
}
