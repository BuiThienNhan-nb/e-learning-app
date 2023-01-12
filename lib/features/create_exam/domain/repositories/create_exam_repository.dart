import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/exam_model.dart';

abstract class CreateExamRepository {
  Future<Either<Failure, ExamModel?>> getLessonExam(
    String lessonId,
  );
  Future<Either<Failure, ExamModel>> createLessonExam(ExamModel exam);
}
