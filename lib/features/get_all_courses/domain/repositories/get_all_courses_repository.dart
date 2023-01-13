import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../home/domain/entities/course_model.dart';

abstract class GetAllCoursesRepository {
  Future<Either<Failure, List<CourseModel>>> getAllCourses();
}
