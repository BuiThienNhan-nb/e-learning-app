import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../repositories/course_rate_repository.dart';
import 'get_course_rate.dart';

class RateCourseUseCase extends UseCase<int, CourseRateParams> {
  final CourseRateRepository repository;

  RateCourseUseCase(this.repository);

  @override
  Future<Either<Failure, int>> call(CourseRateParams params) async =>
      repository.rateCourse(params.courseId, params.userId, params.score);
}
