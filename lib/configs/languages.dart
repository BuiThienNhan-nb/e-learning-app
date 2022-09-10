import 'package:flutter/material.dart';

class AppLanguages {
  AppLanguages._internal();

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('vi'),
  ];

  static Locale fallbackLocale = supportedLocales.first;

  static String defaultLocaleString = supportedLocales.first.languageCode;
}
