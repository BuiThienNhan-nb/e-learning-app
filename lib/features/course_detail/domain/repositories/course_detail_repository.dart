import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/course_detail_model.dart';

abstract class CourseDetailRepository {
  Future<Either<Failure, CourseDetailModel>> getCourseDetail(String courseId);
}
