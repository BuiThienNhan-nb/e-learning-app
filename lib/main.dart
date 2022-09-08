import 'package:e_learning_app/configs/languages.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'utils/dependency_init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initDependency();

  runApp(const MyApp());
}

Future<void> _initDependency() async {
  Intl.defaultLocale = AppLanguages.defaultLocaleString;
  await EasyLocalization.ensureInitialized();
  await DependencyInitializer.init();
}
