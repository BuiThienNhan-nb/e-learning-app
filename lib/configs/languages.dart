import 'package:flutter/material.dart';

class AppLanguages {
  AppLanguages._internal();

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('vi'),
  ];

  static Locale fallbackLocale = supportedLocales.first;

  static String defaultLocaleString = supportedLocales.first.languageCode;

  static List<String> appSupportedLanguages = [
    "English",
    "Tiếng Việt",
    "Español",
    "Français",
    "हिन्दी",
    "Russian",
    "Indonesia",
    "한국인",
    "日本",
    "Italiano",
    "Português",
    "中国人",
  ];
}
