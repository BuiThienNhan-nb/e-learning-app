import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error/failures.dart';
import 'package:e_learning_app/core/usecases/base_use_case.dart';
import 'package:e_learning_app/features/get_all_courses/domain/usecases/get_all_courses_use_case.dart';
import 'package:e_learning_app/features/home/domain/usecases/lesson_use_cases/get_rcm_courses_use_case.dart';
import 'package:e_learning_app/features/list/domain/entities/fetch_courses_by_category_params.dart';
import 'package:e_learning_app/features/list/domain/repositories/fetch_courses_by_category.dart';
import 'package:e_learning_app/features/list/presentation/list_screen_presenter.dart';
import 'package:e_learning_app/features/presenters/list/list_screen_state.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';
import 'package:e_learning_app/features/presenters/top/top_state.dart';
import 'package:e_learning_app/features/top/domain/repositories/fetch_latest_courses.dart';
import 'package:e_learning_app/features/top/domain/repositories/fetch_top_rate_courses.dart';
import 'package:flutter/material.dart';

class ProviderListScreenPresenter
    with ChangeNotifier
    implements ListScreenPresenter {
  ListScreenState _state;
  final GetAllCoursesUseCase _getAllCourses;
  final FetchCoursesByCategory _fetchCoursesByCategory;
  final GetRecommendedCoursesUseCase _getRcmCourses;
  final FetchTopRateCourses _fetchTopRateCourses;
  final FetchLatestCourses _fetchLatestCourses;

  ProviderListScreenPresenter(
    this._state,
    this._getAllCourses,
    this._fetchCoursesByCategory,
    this._getRcmCourses,
    this._fetchTopRateCourses,
    this._fetchLatestCourses,
  );

  @override
  List<CourseModel> get courses => _state.courses;

  @override
  String get errorMessage => _state.errorMessage;

  @override
  void fetchCoursesByType(CoursesType type, String? category) async {
    if (!_state.isLoading) {
      _state = _state.copyWith(isLoading: true);
      notifyListeners();
    }
    if (_state.errorMessage.isNotEmpty) {
      _state = _state.copyWith(errorMessage: '');
      notifyListeners();
    }

    Either<Failure, List<CourseModel>> data;
    try {
      if (category != null) {
        data = await _fetchCoursesByCategory(
            FetchCoursesByCategoryParams(category: category));
      } else {
        switch (type) {
          case CoursesType.recommend:
            data = await _getRcmCourses(NoParams());
            break;
          case CoursesType.latest:
            data = await _fetchLatestCourses();
            break;
          case CoursesType.topRate:
            data = await _fetchTopRateCourses();
            break;
          default:
            data = await _getAllCourses.getAllCourses(NoParams());
            break;
        }
      }

      data.fold(
        (l) => _state = _state.copyWith(errorMessage: l.message.toString()),
        (r) {
          _state = _state.copyWith(courses: r);
        },
      );
    } catch (e) {
      _state = _state.copyWith(errorMessage: e.toString());
    } finally {
      _state = _state.copyWith(isLoading: false);
      notifyListeners();
    }
  }

  @override
  bool get isLoading => _state.isLoading;
}
