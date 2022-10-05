import 'package:easy_localization/easy_localization.dart';

import '../../configs/env.dart';
import '../../features/auth/sign_in/domain/entities/user_info.dart';
import '../../generated/translations/locale_keys.g.dart';

class AppValues {
  AppValues._internal();

  static UserInfo? currentUser;

  static Env env = Env.dev();

  static String mockEmail = "nhan@gmail.com";

  static String mockPassword = "Nhan2509@";

  static List<String> appSupportedGender = [
    LocaleKeys.ma.tr(),
    LocaleKeys.fe.tr(),
    LocaleKeys.ot.tr(),
  ];

  static List<String> roles = [
    "Student",
    "Teacher",
  ];
}
