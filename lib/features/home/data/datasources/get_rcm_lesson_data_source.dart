import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../bases/services/api_exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../utils/mock/mock_courses.dart';
import '../../domain/entities/lesson_model.dart';

abstract class GetRecommendedLessonsDataSource {
  Future<Either<Failure, List<CourseModel>>> getRecommendedLessons();
}

@LazySingleton(as: GetRecommendedLessonsDataSource)
class GetRecommendedLessonDataSourceImp extends Api
    implements GetRecommendedLessonsDataSource {
  @override
  Future<Either<Failure, List<CourseModel>>> getRecommendedLessons() async {
    await Future.delayed(const Duration(seconds: 2));
    return Right(GetIt.I<MockCourses>().recommendedLessons);
  }
}
