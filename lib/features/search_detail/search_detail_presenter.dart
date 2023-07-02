import 'package:e_learning_app/features/top/domain/entities/course_model.dart';
import 'package:flutter/material.dart';

abstract class SearchDetailPresenter implements ChangeNotifier {
  bool get isLoading;

  Future<void> fetchSearchCourses(String keyword);
  List<CourseModel> get courses;
}
