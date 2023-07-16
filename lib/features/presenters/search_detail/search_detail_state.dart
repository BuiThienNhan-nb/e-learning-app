// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';

class SearchDetailState {
  final bool isLoading;
  final List<CourseModel> courses;
  final String? errorMsg;

  SearchDetailState({
    required this.isLoading,
    required this.courses,
    this.errorMsg,
  });

  factory SearchDetailState.initial() {
    return SearchDetailState(
      isLoading: true,
      courses: [],
      errorMsg: '',
    );
  }

  SearchDetailState copyWith({
    bool? isLoading,
    List<CourseModel>? courses,
    String? errorMsg,
  }) {
    return SearchDetailState(
      isLoading: isLoading ?? this.isLoading,
      courses: courses ?? this.courses,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
