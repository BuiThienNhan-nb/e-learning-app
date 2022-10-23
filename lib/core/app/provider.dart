import 'package:e_learning_app/core/app/values.dart';
import 'package:e_learning_app/features/auth/sign_in/domain/entities/user_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppProvider extends ChangeNotifier {
  bool _isLogin = false;
  UserInfo? _user;
  bool _hasNotification = true;

  bool get isLogin => _isLogin;
  UserInfo get user =>
      _user ??
      UserInfo(
        id: "id_test",
        name: "Bùi Thiện Nhân",
        email: "nhan@gmail.com",
        birthday: DateTime.now(),
        role: AppValues.instance.title.first,
        gender: AppValues.instance.appSupportedGender.first,
      );
  bool get hasNotification => _hasNotification;

  set isLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }

  set user(UserInfo value) {
    _user = value;
    notifyListeners();
  }

  set hasNotification(bool value) {
    _hasNotification = value;
    notifyListeners();
  }
}
