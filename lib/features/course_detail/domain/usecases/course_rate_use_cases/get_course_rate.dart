import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../repositories/course_rate_repository.dart';

class GetCourseRateUseCase extends UseCase<int?, CourseRateParams> {
  final CourseRateRepository repository;

  GetCourseRateUseCase(this.repository);

  @override
  Future<Either<Failure, int?>> call(CourseRateParams params) async =>
      repository.getCourseRate(params.courseId, params.userId);
}

class CourseRateParams extends Equatable {
  final String userId;
  final String courseId;
  final int score;

  const CourseRateParams(this.userId, this.courseId, this.score);

  @override
  List<Object?> get props => [userId, courseId, score];
}
