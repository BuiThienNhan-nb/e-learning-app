// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en = {
    "authenticate": {
      "signIn": "SignIn",
      "signUp": "SignUp",
      "forgotPassword": "Forgot Password",
      "alreadyHaveAccount": "Already have an account?",
      "welcome": "Welcome",
      "signInToContinue": "Sign in to continue",
      "signUpToContinue": "Sign up to continue",
      "termAgree": "By signing up you are agreed with our friendly",
      "termsCondition": "Terms and Condition"
    }
  };
  static const Map<String, dynamic> vi = {
    "authenticate": {
      "signIn": "Đăng nhập",
      "signUp": "Đăng ký",
      "forgotPassword": "Quên mật khẩu",
      "alreadyHaveAccount": "Đã có tài khoản?",
      "welcome": "Chào mừng",
      "signInToContinue": "Đăng nhập để tiếp tục",
      "signUpToContinue": "Đăng ký để tiếp tục",
      "termAgree": "By signing up you are agreed with our friendly",
      "termsCondition": "Terms and Condition"
    }
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en": en,
    "vi": vi
  };
}
