import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';

import '../../../../core/error/failures.dart';

abstract class GetRecommendedCoursesRepository {
  Future<Either<Failure, List<CourseModel>>> getRecommendedLessons();
}
