import 'package:e_learning_app/features/home/domain/repositories/lesson_repository.dart';
import 'package:e_learning_app/features/home/domain/usecases/lesson_use_cases/get_rcm_lesson_use_case.dart';

class LessonUseCases {
  final LessonRepository repository;

  late final GetRecommendedLessonsUseCase getRecommendedLessonsUseCase;

  LessonUseCases(this.repository) {
    getRecommendedLessonsUseCase = GetRecommendedLessonsUseCase(repository);
  }
}
