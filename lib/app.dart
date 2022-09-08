import 'package:e_learning_app/configs/dimens.dart';
import 'package:e_learning_app/configs/languages.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'configs/routes.dart';
import 'configs/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      path: 'assets/translations',
      supportedLocales: AppLanguages.supportedLocales,
      fallbackLocale: AppLanguages.fallbackLocale,
      child: ScreenUtilInit(
        designSize: AppDimens.appDesignSize,
        builder: (_, __) => Builder(builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: ThemeData(
              textTheme: AppThemes.appTextTheme,
              colorScheme: AppThemes.appColorSchema,
            ),
            onGenerateRoute: (settings) =>
                AppRoutes().onGenerateRoute(settings),
            initialRoute: AppRoutes.init,
          );
        }),
      ),
    );
  }
}
