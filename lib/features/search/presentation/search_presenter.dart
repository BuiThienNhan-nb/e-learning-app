import 'package:e_learning_app/features/auth/sign_in/domain/entities/teacher_model.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';
import 'package:flutter/material.dart';

abstract class SearchPresenter implements ChangeNotifier {
  List<String> get historySearch;
  ScrollController get scrollController;
  TextEditingController get searchController;
  bool get isShowClearButton;
  String? get errorMessage;
  String? get searchKey;
  List<TeacherModel> get teachers;
  bool get isTeacherLoading;
  String? get fetchTeacherErrorMessage;
  List<CourseModel> get courses;
  String get searchErrorMsg;
  bool get searchLoading;

  void handleTagTap(int selectIndex);
  void onKeywordChanged(String text);
  Future<void> handleSearch(String text);
  void fetchSearchLocal();
  void handleClearButton();
  void fetchTeachers();
  Future<void> search(String keyword);
}
