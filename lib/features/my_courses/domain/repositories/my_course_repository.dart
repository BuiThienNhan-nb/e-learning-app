import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../home/domain/entities/course_model.dart';
import '../../../home/domain/entities/section_model.dart';

abstract class MyCourseRepository {
  Future<Either<Failure, List<CourseModel>>> getMyCourses();
  Future<Either<Failure, CourseModel>> createCourse(CourseModel course);
  Future<Either<Failure, CourseModel>> updateCourseInformation(
    CourseModel course,
    bool isUpdateImage,
  );
  Future<Either<Failure, bool>> deleteCourse(String courseId);
  Future<Either<Failure, SectionModel>> updateCourseSection(
    SectionModel section,
    String courseId,
  );
  Future<Either<Failure, SectionModel>> createCourseSection(
    SectionModel section,
    String courseId,
  );
  Future<Either<Failure, bool>> deleteSection(
    String courseId,
    String sectionId,
  );
}
