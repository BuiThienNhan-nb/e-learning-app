import 'package:dartz/dartz.dart';

import '../../../../bases/services/api_exception.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/lesson_model.dart';

abstract class LessonDataSource {
  Future<Either<Failure, List<LessonModel>>> getRecommendedLessons();
}

class LessonDataSourceImp extends Api implements LessonDataSource {
  @override
  Future<Either<Failure, List<LessonModel>>> getRecommendedLessons() {
    throw UnimplementedError();
  }
}
