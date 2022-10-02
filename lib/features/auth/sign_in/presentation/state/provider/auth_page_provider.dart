import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../generated/translations/locale_keys.g.dart';

class AuthPageProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reEnterPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController datePickerController = TextEditingController();
  String _gender = LocaleKeys.ma.tr();

  String get gender => _gender;

  set gender(String value) {
    _gender = value;
    notifyListeners();
  }

  final signInKey = GlobalKey<FormState>();
  final signUpKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    reEnterPasswordController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
