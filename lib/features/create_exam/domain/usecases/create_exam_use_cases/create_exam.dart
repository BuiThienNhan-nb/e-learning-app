import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../entities/exam_model.dart';
import '../../repositories/create_exam_repository.dart';

class CreateExam extends UseCase<ExamModel, CreateExamParams> {
  final CreateExamRepository _repository;

  CreateExam(this._repository);

  @override
  Future<Either<Failure, ExamModel>> call(CreateExamParams params) async =>
      _repository.createLessonExam(params.exam);
}

class CreateExamParams extends Equatable {
  final ExamModel exam;

  const CreateExamParams(this.exam);

  @override
  List<Object?> get props => [exam];
}
