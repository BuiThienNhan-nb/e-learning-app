import 'package:injectable/injectable.dart';

import '../repositories/course_detail_repository.dart';
import 'course_detail_use_case/get_course_detail_use_case.dart';
import 'course_detail_use_case/join_course_use_case.dart';

@lazySingleton
class CourseDetailUseCases {
  final CourseDetailRepository repository;
  late final GetCourseDetailUseCase getCourseDetailUseCase;
  late final JoinCourse joinCourse;

  CourseDetailUseCases(this.repository) {
    getCourseDetailUseCase = GetCourseDetailUseCase(repository);
    joinCourse = JoinCourse(repository);
  }
}
