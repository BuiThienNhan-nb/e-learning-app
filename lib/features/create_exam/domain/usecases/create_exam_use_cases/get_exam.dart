import 'package:e_learning_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/usecases/base_use_case.dart';
import 'package:e_learning_app/features/create_exam/domain/entities/exam_model.dart';
import 'package:e_learning_app/features/create_exam/domain/repositories/create_exam_repository.dart';
import 'package:equatable/equatable.dart';

class GetExam extends UseCase<ExamModel?, GetExamParams> {
  final CreateExamRepository _repository;

  GetExam(this._repository);

  @override
  Future<Either<Failure, ExamModel?>> call(GetExamParams params) async =>
      _repository.getLessonExam(params.lessonId);
}

class GetExamParams extends Equatable {
  final String lessonId;

  const GetExamParams(this.lessonId);

  @override
  List<Object?> get props => [lessonId];
}
