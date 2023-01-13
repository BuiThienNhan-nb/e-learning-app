import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../repositories/course_rate_repository.dart';

class GetCourseRateUseCase extends UseCase<int?, GetCourseRateParams> {
  final CourseRateRepository repository;

  GetCourseRateUseCase(this.repository);

  @override
  Future<Either<Failure, int?>> call(GetCourseRateParams params) async =>
      repository.getCourseRate(params.courseId, params.userId);
}

class GetCourseRateParams extends Equatable {
  final String userId;
  final String courseId;

  const GetCourseRateParams(this.userId, this.courseId);

  @override
  List<Object?> get props => [userId, courseId];
}
