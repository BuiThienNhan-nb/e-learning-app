import 'values.dart';
import '../../features/auth/sign_in/domain/entities/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppProvider extends ChangeNotifier {
  bool _isLogin = false;
  UserModel? _user;
  bool _hasNotification = true;
  String _accessToken = "";

  bool get isLogin => _isLogin;
  String get accessToken => _accessToken;
  UserModel get user =>
      _user ??
      UserModel(
        id: "id_test",
        name: "Bùi Thiện Nhân",
        email: "nhan@gmail.com",
        birthday: DateTime.now(),
        role: AppValues.instance.title.first,
        gender: AppValues.instance.appSupportedGender.first,
        isPremium: false,
      );
  bool get hasNotification => _hasNotification;

  set isLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }

  set user(UserModel value) {
    _user = value;
    notifyListeners();
  }

  set hasNotification(bool value) {
    _hasNotification = value;
    notifyListeners();
  }

  set accessToken(String value) {
    _accessToken = value;
    notifyListeners();
  }
}
