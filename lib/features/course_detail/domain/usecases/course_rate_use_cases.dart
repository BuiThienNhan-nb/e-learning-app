import 'package:injectable/injectable.dart';

import '../repositories/course_rate_repository.dart';
import 'course_rate_use_cases/get_course_rate.dart';
import 'course_rate_use_cases/rate_course.dart';

@lazySingleton
class CourseRateUseCases {
  final CourseRateRepository repository;
  late GetCourseRateUseCase getCourseRateUseCase;
  late RateCourseUseCase rateCourseUseCase;

  CourseRateUseCases(this.repository) {
    getCourseRateUseCase = GetCourseRateUseCase(repository);
    rateCourseUseCase = RateCourseUseCase(repository);
  }
}
