import 'package:flutter/foundation.dart';

class AuthPageProvider extends ChangeNotifier {
  bool _isLogin = false;

  bool get isLogin => _isLogin;

  void goToSignUp() {
    if (_isLogin) {
      _isLogin = false;
      notifyListeners();
    }
  }

  void goToSignIn() {
    if (!_isLogin) {
      _isLogin = true;
      notifyListeners();
    }
  }
}
