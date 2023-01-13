import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../../../home/domain/entities/course_model.dart';
import '../../repositories/get_all_courses_repository.dart';

class GetAllCourses extends UseCase<List<CourseModel>, NoParams> {
  final GetAllCoursesRepository _repository;

  GetAllCourses(this._repository);

  @override
  Future<Either<Failure, List<CourseModel>>> call(NoParams params) async =>
      _repository.getAllCourses();
}
