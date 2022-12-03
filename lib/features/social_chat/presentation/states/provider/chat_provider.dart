import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChatProvider extends ChangeNotifier {
  final TextEditingController chatController = TextEditingController();

  final passwordKey = GlobalKey<FormState>();

  @override
  void dispose() {
    chatController.dispose();
    super.dispose();
  }
}
