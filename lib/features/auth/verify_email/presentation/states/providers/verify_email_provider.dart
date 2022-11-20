import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyEmailProvider extends ChangeNotifier {
  final TextEditingController token = TextEditingController();

  final key = GlobalKey<FormState>();
}
