import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class LessonDetailPageProvider extends ChangeNotifier {
  final TextEditingController commentController = TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
    log("dispose LessonDetailPageProvider");
    super.dispose();
  }
}
