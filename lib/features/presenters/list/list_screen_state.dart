// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';

class ListScreenState {
  final bool isLoading;
  final String errorMessage;
  final List<CourseModel> courses;

  ListScreenState({
    required this.isLoading,
    required this.errorMessage,
    required this.courses,
  });

  factory ListScreenState.initial() {
    return ListScreenState(
      isLoading: true,
      errorMessage: '',
      courses: [],
    );
  }

  ListScreenState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<CourseModel>? courses,
  }) {
    return ListScreenState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      courses: courses ?? this.courses,
    );
  }
}
