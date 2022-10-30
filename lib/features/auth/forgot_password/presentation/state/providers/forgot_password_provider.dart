import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ForgotPasswordPageProvider extends ChangeNotifier {
  final TextEditingController idCodeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final passwordKey = GlobalKey<FormState>();

  @override
  void dispose() {
    idCodeController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
