import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../entities/lesson_model.dart';
import '../../repositories/get_rcm_lessons_repository.dart';

@lazySingleton
class GetRecommendedLessonsUseCase
    implements UseCase<List<LessonModel>, NoParams> {
  final GetRecommendedLessonsRepository _repository;

  GetRecommendedLessonsUseCase(this._repository);

  @override
  Future<Either<Failure, List<LessonModel>>> call(NoParams params) async {
    return _repository.getRecommendedLessons();
  }
}
