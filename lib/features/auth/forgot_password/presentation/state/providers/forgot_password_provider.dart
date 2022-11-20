import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgotPasswordPageProvider extends ChangeNotifier {
  final TextEditingController tokenController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final passwordKey = GlobalKey<FormState>();

  @override
  void dispose() {
    tokenController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
