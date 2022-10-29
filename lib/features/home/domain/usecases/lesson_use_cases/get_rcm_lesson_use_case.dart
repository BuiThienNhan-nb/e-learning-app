import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/home/domain/repositories/lesson_repository.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../entities/lesson_model.dart';

class GetRecommendedLessonsUseCase
    implements UseCase<List<LessonModel>, NoParams> {
  final LessonRepository _repository;

  GetRecommendedLessonsUseCase(this._repository);

  @override
  Future<Either<Failure, List<LessonModel>>> call(NoParams params) async {
    return _repository.getRecommendedLessons();
  }
}
