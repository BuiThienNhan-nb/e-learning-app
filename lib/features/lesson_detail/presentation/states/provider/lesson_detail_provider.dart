import 'package:e_learning_app/features/lesson_detail/domain/entities/lesson_comment_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class LessonDetailPageProvider extends ChangeNotifier {
  final TextEditingController commentController = TextEditingController();
  final List<LessonCommentModel> socketComments = [];

  void addComment(LessonCommentModel comment) {
    socketComments.insert(0, comment);
    notifyListeners();
  }

  @override
  void dispose() {
    commentController.dispose();
    print("dispose LessonDetailPageProvider");
    super.dispose();
  }
}
