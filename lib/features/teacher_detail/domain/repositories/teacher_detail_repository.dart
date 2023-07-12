import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';

import '../../../../core/error/failures.dart';
import '../../../auth/sign_in/domain/entities/teacher_model.dart';

abstract class TeacherDetailRepository {
  Future<Either<Failure, TeacherModel>> getTeacherById(String teacherId);
  Future<Either<Failure, List<CourseModel>>> getTeacherCourse(String teacherId);
}
