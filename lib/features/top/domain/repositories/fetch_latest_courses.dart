import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error/failures.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';

abstract class FetchLatestCourses {
  Future<Either<Failure, List<CourseModel>>> call();
}
