import 'package:e_learning_app/features/auth/sign_in/domain/usecases/auth_use_case.dart';
import 'package:e_learning_app/features/auth/sign_in/domain/usecases/auth_use_case/get_user_by_id_use_case.dart';
import 'package:e_learning_app/features/lesson_detail/domain/entities/lesson_comment_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@injectable
class LessonDetailPageProvider extends ChangeNotifier {
  final TextEditingController commentController = TextEditingController();
  final List<LessonCommentModel> socketComments = [];

  void addComment(LessonCommentModel comment) {
    socketComments.insert(0, comment);
    notifyListeners();
  }

  bool _isGetAvatar = true;
  bool get isGetAvatar => _isGetAvatar;
  String _avatar = 'null';
  String get avatar => _avatar;

  Future<String> getAvatarById(String userId) async {
    if (!_isGetAvatar) {
      _isGetAvatar = true;
      notifyListeners();
    }

    try {
      final data = await GetIt.I<AuthUseCase>().getUserUseCase(
        GetUserByIdParams(userId),
      );
      data.fold(
        (l) => debugPrint(l.message),
        (r) => _avatar = r.avatar ?? 'null',
      );
      return avatar;
    } catch (e) {
      debugPrint(e.toString());
      return 'null';
    }
  }

  @override
  void dispose() {
    commentController.dispose();
    print("dispose LessonDetailPageProvider");
    super.dispose();
  }
}
