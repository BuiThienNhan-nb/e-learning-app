import 'package:flutter/material.dart';

class AuthPageProvider extends ChangeNotifier {
  bool _isLogin = false;
  bool get isLogin => _isLogin;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reEnterPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();

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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    reEnterPasswordController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
