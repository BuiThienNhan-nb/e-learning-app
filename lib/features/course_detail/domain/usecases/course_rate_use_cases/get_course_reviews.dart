import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../entities/course_review_model.dart';
import '../../repositories/course_rate_repository.dart';

class GetCourseReview
    extends UseCase<List<CourseReviewModel>, GetCourseReviewParams> {
  final CourseRateRepository _repository;

  GetCourseReview(this._repository);

  @override
  Future<Either<Failure, List<CourseReviewModel>>> call(
          GetCourseReviewParams params) async =>
      _repository.getListReviewOfCourse(params.courseId);
}

class GetCourseReviewParams extends Equatable {
  final String courseId;

  const GetCourseReviewParams(this.courseId);

  @override
  List<Object?> get props => [courseId];
}
