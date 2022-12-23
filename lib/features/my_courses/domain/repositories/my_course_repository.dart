import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error/failures.dart';
import 'package:e_learning_app/features/home/domain/entities/course_model.dart';

abstract class MyCourseRepository {
  Future<Either<Failure, CourseModel>> createCourse(CourseModel course);
  Future<Either<Failure, CourseModel>> updateCourse(CourseModel course);
  Future<Either<Failure, bool>> deleteCourse(String courseId);
}
