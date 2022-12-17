import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/base_use_case.dart';
import '../entities/lesson_comment_model.dart';
import '../repositories/get_lesson_comments.dart';

@lazySingleton
class GetLessonCommentsUseCase
    extends UseCase<List<LessonCommentModel>, GetLessonCommentsUseCaseParams> {
  final GetLessonCommentsRepository repository;

  GetLessonCommentsUseCase(this.repository);

  @override
  Future<Either<Failure, List<LessonCommentModel>>> call(
          GetLessonCommentsUseCaseParams params) async =>
      repository.getLessonComments(params.lessonId);
}

class GetLessonCommentsUseCaseParams extends Equatable {
  final String lessonId;

  const GetLessonCommentsUseCaseParams(this.lessonId);

  @override
  List<Object?> get props => [lessonId];
}
