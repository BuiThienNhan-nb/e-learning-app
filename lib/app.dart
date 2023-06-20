import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'configs/dimens.dart';
import 'configs/languages.dart';
import 'configs/routes.dart';
import 'configs/themes.dart';
import 'core/app/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = GetIt.I<AppRoutes>().router;
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<AppProvider>(),
      builder: (context, child) => EasyLocalization(
        path: 'assets/translations',
        supportedLocales: AppLanguages.supportedLocales,
        fallbackLocale: AppLanguages.fallbackLocale,
        startLocale: AppLanguages.fallbackLocale,
        child: ScreenUtilInit(
          designSize: AppDimens.appDesignSize,
          builder: (_, __) => Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  // Unfocus when tap out side
                  FocusScopeNode currentNode = FocusScope.of(context);
                  if (!currentNode.hasPrimaryFocus) {
                    currentNode.unfocus();
                    currentNode.requestFocus(FocusNode());
                  }
                },
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  theme: AppThemes.lightTheme,
                  routerDelegate: router.routerDelegate,
                  routeInformationParser: router.routeInformationParser,
                  routeInformationProvider: router.routeInformationProvider,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
