import 'package:injectable/injectable.dart';

import '../repositories/do_exam_repository.dart';
import 'do_exam_use_case/get_exam.dart';

@lazySingleton
class DoExamUseCase {
  final DoExamRepository _repository;
  late GetExam getExam;

  DoExamUseCase(this._repository) {
    getExam = GetExam(_repository);
  }
}
