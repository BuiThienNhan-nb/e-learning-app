import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../entities/course_review_model.dart';
import '../../repositories/course_rate_repository.dart';

class RateCourseUseCase extends UseCase<int, RateCourseParams> {
  final CourseRateRepository repository;

  RateCourseUseCase(this.repository);

  @override
  Future<Either<Failure, int>> call(RateCourseParams params) async =>
      repository.rateCourse(params.courseReviewModel);
}

class RateCourseParams extends Equatable {
  final CourseReviewModel courseReviewModel;

  const RateCourseParams(this.courseReviewModel);

  @override
  List<Object?> get props => [courseReviewModel];
}
