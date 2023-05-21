import 'dart:developer';

import 'package:e_learning_app/core/app/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:safe_device/safe_device.dart';

import 'app.dart';
import 'configs/env.dart';
import 'configs/languages.dart';
import 'firebase_options.dart';
import 'generated/service_locator/dependency_injection.dart';

String decodeYoutubeUrl = "";
bool isPhysicDevice = false;

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
  isPhysicDevice = await SafeDevice.isRealDevice;
  await dotenv.load(fileName: ".env").then(
        (_) => log(Env.instance.localUrl),
      );
  await AppLocal.instance.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Permission.camera.request();
  await Permission.microphone.request();
}
