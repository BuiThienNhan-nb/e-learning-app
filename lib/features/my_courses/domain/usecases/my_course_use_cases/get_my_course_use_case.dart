import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../../../top/domain/entities/course_model.dart';
import '../../repositories/my_course_repository.dart';

class GetMyCourse extends UseCase<List<CourseModel>, NoParams> {
  final MyCourseRepository _repository;

  GetMyCourse(this._repository);

  @override
  Future<Either<Failure, List<CourseModel>>> call(NoParams params) async =>
      _repository.getMyCourses();
}
