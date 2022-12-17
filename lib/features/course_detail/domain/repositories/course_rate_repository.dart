import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class CourseRateRepository {
  Future<Either<Failure, int?>> getCourseRate(
    String courseId,
    String userId,
  );

  Future<Either<Failure, int>> rateCourse(
    String courseId,
    String userId,
    int score,
  );
}
