import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../entities/course_model.dart';
import '../../repositories/get_rcm_courses_repository.dart';

@lazySingleton
class GetRecommendedCoursesUseCase
    implements UseCase<List<CourseModel>, NoParams> {
  final GetRecommendedCoursesRepository _repository;

  GetRecommendedCoursesUseCase(this._repository);

  @override
  Future<Either<Failure, List<CourseModel>>> call(NoParams params) async {
    return _repository.getRecommendedLessons();
  }
}
