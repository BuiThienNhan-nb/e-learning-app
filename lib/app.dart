import 'package:e_learning_app/configs/dimens.dart';
import 'package:e_learning_app/configs/languages.dart';
import 'package:e_learning_app/configs/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'configs/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      path: 'assets/translations',
      supportedLocales: AppLanguages.supportedLocales,
      fallbackLocale: AppLanguages.fallbackLocale,
      startLocale: AppLanguages.fallbackLocale,
      child: ScreenUtilInit(
        designSize: AppDimens.appDesignSize,
        builder: (_, __) => Builder(
          builder: (context) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: ThemeData(
                textTheme: AppThemes.appTextTheme,
                colorScheme: AppThemes.appColorSchema,
              ),
              routerDelegate: AppRoutes.instance.router.routerDelegate,
              routeInformationParser:
                  AppRoutes.instance.router.routeInformationParser,
              routeInformationProvider:
                  AppRoutes.instance.router.routeInformationProvider,
            );
          },
        ),
      ),
    );
  }
}
