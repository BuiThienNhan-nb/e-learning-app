import 'package:injectable/injectable.dart';

import '../repositories/create_exam_repository.dart';
import 'create_exam_use_cases/create_exam.dart';
import 'create_exam_use_cases/get_exam.dart';

@lazySingleton
class CreateExamUseCase {
  final CreateExamRepository _repository;
  late final GetExam getExam;
  late final CreateExam createExam;

  CreateExamUseCase(this._repository) {
    getExam = GetExam(_repository);
    createExam = CreateExam(_repository);
  }
}
