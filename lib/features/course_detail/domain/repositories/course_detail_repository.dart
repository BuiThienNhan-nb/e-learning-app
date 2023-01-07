import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/auth/sign_in/domain/entities/user_model.dart';

import '../../../../core/error/failures.dart';
import '../entities/course_detail_model.dart';

abstract class CourseDetailRepository {
  Future<Either<Failure, CourseDetailModel>> getCourseDetail(String courseId);
  Future<Either<Failure, UserModel>> enrollCourse(
    String userId,
    String courseId,
  );
}
