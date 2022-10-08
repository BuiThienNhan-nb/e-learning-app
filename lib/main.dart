import 'dart:developer';

import 'package:e_learning_app/configs/env.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app.dart';
import 'configs/languages.dart';
import 'utils/dependency_init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initDependency();
  await _initServices();

  runApp(const MyApp());
}

Future<void> _initDependency() async {
  Intl.defaultLocale = AppLanguages.defaultLocaleString;
  await EasyLocalization.ensureInitialized();
  await DependencyInitializer.init();
}

Future<void> _initServices() async {
  await dotenv.load(fileName: ".env").then(
        (_) => log(Env.instance.test),
      );
}
