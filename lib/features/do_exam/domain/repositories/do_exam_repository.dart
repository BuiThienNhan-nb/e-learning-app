import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../create_exam/domain/entities/exam_model.dart';

abstract class DoExamRepository {
  Future<Either<Failure, ExamModel>> getLessonExam(
    String lessonId,
  );
}
