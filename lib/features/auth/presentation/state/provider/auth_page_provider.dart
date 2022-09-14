import 'package:flutter/material.dart';

class AuthPageProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reEnterPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    reEnterPasswordController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
