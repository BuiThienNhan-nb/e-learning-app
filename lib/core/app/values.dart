import '../../configs/env.dart';
import '../../features/auth/sign_in/domain/entities/user_info.dart';
import '../../generated/translations/locale_keys.g.dart';

class AppValues {
  AppValues._internal();

  static AppValues instance = AppValues._internal();

  factory AppValues() {
    return instance;
  }

  UserInfo? currentUser;

  final Env env = Env.dev();

  final String mockEmail = "nhan@gmail.com";

  final String mockPassword = "Nhan2509@";

  final List<String> appSupportedGender = [
    LocaleKeys.ma,
    LocaleKeys.fe,
    LocaleKeys.ot,
  ];

  final List<String> title = [
    LocaleKeys.teacher,
    LocaleKeys.student,
  ];
}
