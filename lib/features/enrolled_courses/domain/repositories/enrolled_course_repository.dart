import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../top/domain/entities/course_model.dart';

abstract class EnrolledCourseRepository {
  Future<Either<Failure, List<CourseModel>>> getCourseByListId(
      List<String> listId);
}
