import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../auth/sign_in/domain/entities/teacher_model.dart';

abstract class GetTopTeachersRepository {
  Future<Either<Failure, List<TeacherModel>>> getTopTeachers();
}
