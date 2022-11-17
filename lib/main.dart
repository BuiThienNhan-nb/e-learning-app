import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app.dart';
import 'configs/env.dart';
import 'configs/languages.dart';
import 'generated/service_locator/dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initDependency();
  await _initServices();

  runApp(const MyApp());
}

Future<void> _initDependency() async {
  Intl.defaultLocale = AppLanguages.defaultLocaleString;
  await EasyLocalization.ensureInitialized();
  configureDependencies();
}

Future<void> _initServices() async {
  // String url = await "https://youtu.be/rjo2JUPrCvE?list=RDrjo2JUPrCvE"
  //     .extractYoutubeUrl();
  await dotenv.load(fileName: ".env").then(
        (_) => log(Env.instance.test),
      );
  // log(url);
}
