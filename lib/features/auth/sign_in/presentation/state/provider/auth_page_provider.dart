import 'package:flutter/material.dart';

class AuthPageProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController datePickerController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  int _genderIndex = 0;
  int _titleIndex = 0;

  int get genderIndex => _genderIndex;
  int get titleIndex => _titleIndex;

  set genderIndex(int value) {
    _genderIndex = value;
    notifyListeners();
  }

  set titleIndex(int value) {
    _titleIndex = value;
    notifyListeners();
  }

  final signInKey = GlobalKey<FormState>();
  final signUpKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    datePickerController.dispose();
    phoneNumberController.dispose();

    super.dispose();
  }
}
