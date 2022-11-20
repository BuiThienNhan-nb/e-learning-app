import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetForgotPasswordCodeProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();

  final emailKey = GlobalKey<FormState>();
}
