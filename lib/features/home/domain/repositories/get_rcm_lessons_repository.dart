import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/course_model.dart';

abstract class GetRecommendedLessonsRepository {
  Future<Either<Failure, List<CourseModel>>> getRecommendedLessons();
}
