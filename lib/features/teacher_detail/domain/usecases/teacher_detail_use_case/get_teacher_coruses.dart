import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../../../top/domain/entities/course_model.dart';
import '../../repositories/teacher_detail_repository.dart';
import 'get_teacher_by_id.dart';

class GetTeacherCourse
    extends UseCase<List<CourseModel>, GetTeacherByIdParams> {
  final TeacherDetailRepository _repository;

  GetTeacherCourse(this._repository);

  @override
  Future<Either<Failure, List<CourseModel>>> call(
          GetTeacherByIdParams params) async =>
      _repository.getTeacherCourse(params.teacherId);
}
