// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_learning_app/features/presenters/search_detail/search_detail_state.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';
import 'package:e_learning_app/utils/mock/mock_courses.dart';
import 'package:flutter/material.dart';

import 'package:e_learning_app/features/search_detail/search_detail_presenter.dart';

class ProviderSearchDetailPresenter extends ChangeNotifier
    implements SearchDetailPresenter {
  SearchDetailState _state;

  ProviderSearchDetailPresenter(this._state);

  @override
  List<CourseModel> get courses => _state.courses;

  @override
  Future<void> fetchSearchCourses(String keyword) async {
    if (!_state.isLoading) {
      _state = _state.copyWith(isLoading: true);
      notifyListeners();
    }

    await Future.delayed(const Duration(seconds: 1)).then(
      (_) {
        _state = _state.copyWith(
          isLoading: false,
          courses: MockCourses.randomCourses(
            MockCourses().recommendedLessons,
            20,
          ),
        );
        notifyListeners();
      },
    );
  }

  @override
  bool get isLoading => _state.isLoading;
}
