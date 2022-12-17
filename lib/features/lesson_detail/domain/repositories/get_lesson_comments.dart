import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/lesson_comment_model.dart';

abstract class GetLessonCommentsRepository {
  Future<Either<Failure, List<LessonCommentModel>>> getLessonComments(
      String lessonId);
}
