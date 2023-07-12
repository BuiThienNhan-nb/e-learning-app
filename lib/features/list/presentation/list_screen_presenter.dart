import 'package:e_learning_app/features/presenters/top/top_state.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';
import 'package:flutter/material.dart';

abstract class ListScreenPresenter implements ChangeNotifier {
  bool get isLoading;
  List<CourseModel> get courses;
  String get errorMessage;

  void fetchCoursesByType(CoursesType type);
}
