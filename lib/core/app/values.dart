import 'package:e_learning_app/configs/env.dart';
import 'package:e_learning_app/features/auth/domain/entities/user_info.dart';
import 'package:flutter/material.dart';

class AppValues {
  AppValues._internal();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static UserInfo? currentUser;

  static Env env = Env.dev();

  static String mockEmail = "nhan@gmail.com";

  static String mockPassword = "Nhan2509@";

  static List<String> roles = [
    "Student",
    "Teacher",
  ];
}
