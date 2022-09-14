import 'dart:developer';

import 'package:e_learning_app/features/auth/presentation/pages/auth_page.dart';
import 'package:e_learning_app/features/auth/presentation/state/mobx/auth_store.dart';
import 'package:e_learning_app/features/auth/presentation/state/provider/auth_page_provider.dart';
import 'package:e_learning_app/features/home_landing/presentation/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class AppRoutes {
  AppRoutes._internal();

  static final AppRoutes _singleton = AppRoutes._internal();

  factory AppRoutes() {
    return _singleton;
  }

  // Route name
  static const String home = "/home";
  static const String auth = "/auth";

  // initial Route
  static String get init => auth;

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return CupertinoPageRoute(
          builder: (context) => const HomePage(),
        );
      case AppRoutes.auth:
        return CupertinoPageRoute(
          builder: (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider<AuthPageProvider>(
                create: (BuildContext context) => GetIt.I(),
                lazy: true,
              ),
              Provider<AuthStore>(
                create: (_) => GetIt.I(),
                lazy: true,
                dispose: (context, value) {
                  log("dispose");
                },
              ),
            ],
            child: const AuthPage(),
          ),
        );
      default:
        return _errorRoute();
    }
  }

  Route _errorRoute() {
    return CupertinoPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('Error'),
        ),
      ),
      settings: const RouteSettings(
        name: '/error',
      ),
    );
  }
}
