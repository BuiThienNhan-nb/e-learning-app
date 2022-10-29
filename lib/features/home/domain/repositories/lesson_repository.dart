import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/lesson_model.dart';

abstract class LessonRepository {
  Future<Either<Failure, List<LessonModel>>> getRecommendedLessons();
}
