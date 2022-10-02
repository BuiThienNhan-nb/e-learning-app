import '../../configs/env.dart';
import '../../features/auth/sign_in/domain/entities/user_info.dart';

class AppValues {
  AppValues._internal();

  static UserInfo? currentUser;

  static Env env = Env.dev();

  static String mockEmail = "nhan@gmail.com";

  static String mockPassword = "Nhan2509@";

  static List<String> roles = [
    "Student",
    "Teacher",
  ];
}
