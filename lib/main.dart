import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:permission_handler/permission_handler.dart';

import 'app.dart';
import 'configs/env.dart';
import 'configs/languages.dart';
import 'firebase_options.dart';
import 'generated/service_locator/dependency_injection.dart';
import 'utils/extensions/youtube_link_extension.dart';

String decodeYoutubeUrl = "";

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
  await "https://youtu.be/rjo2JUPrCvE?list=RDrjo2JUPrCvE"
      .extractYoutubeUrl()
      .then((value) => decodeYoutubeUrl =
          "https://firebasestorage.googleapis.com/v0/b/e-learning-4122a.appspot.com/o/videos%2F2022-12-21%2008-50-37.mkv?alt=media&token=a06a8e33-e493-462e-9d53-7e0679bd0b9e");
  await dotenv.load(fileName: ".env").then(
        (_) => log(Env.instance.test),
      );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Permission.camera.request();
  await Permission.microphone.request();
}
