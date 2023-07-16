import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error/failures.dart';
import 'package:e_learning_app/features/list/domain/entities/fetch_courses_by_category_params.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';

abstract class FetchCoursesByCategory {
  Future<Either<Failure, List<CourseModel>>> call(
      FetchCoursesByCategoryParams params);
}
