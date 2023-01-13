import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/course_review_model.dart';

abstract class CourseRateRepository {
  Future<Either<Failure, int?>> getCourseRate(
    String courseId,
    String userId,
  );

  Future<Either<Failure, List<CourseReviewModel>>> getListReviewOfCourse(
    String courseId,
  );

  Future<Either<Failure, int>> rateCourse(
    CourseReviewModel courseReviewModel,
  );
}
