import 'package:e_learning_app/core/error/failures.dart';

import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/do_exam/domain/repositories/do_exam_repository.dart';

import '../../../../../core/usecases/base_use_case.dart';
import '../../../../create_exam/domain/entities/exam_model.dart';
import '../../../../create_exam/domain/usecases/create_exam_use_cases/get_exam.dart';

class GetExam extends UseCase<ExamModel, GetExamParams> {
  final DoExamRepository _repository;

  GetExam(this._repository);

  @override
  Future<Either<Failure, ExamModel>> call(GetExamParams params) async =>
      _repository.getLessonExam(params.lessonId);
}
