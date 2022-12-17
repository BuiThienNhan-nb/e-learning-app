import 'package:e_learning_app/features/lesson_detail/domain/repositories/get_lesson_comments.dart';
import 'package:e_learning_app/features/lesson_detail/domain/usecases/get_lesson_comments_ues_case.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LessonDetailUseCase {
  final GetLessonCommentsRepository repository;

  late GetLessonCommentsUseCase getLessonCommentsUseCase;

  LessonDetailUseCase(this.repository) {
    getLessonCommentsUseCase = GetLessonCommentsUseCase(repository);
  }
}
