import 'package:injectable/injectable.dart';

import '../repositories/teacher_detail_repository.dart';
import 'teacher_detail_use_case/get_teacher_by_id.dart';
import 'teacher_detail_use_case/get_teacher_coruses.dart';

@lazySingleton
class TeacherDetailUseCase {
  final TeacherDetailRepository _repository;
  late final GetTeacherById getTeacherById;
  late final GetTeacherCourse getTeacherCourse;

  TeacherDetailUseCase(this._repository) {
    getTeacherById = GetTeacherById(_repository);
    getTeacherCourse = GetTeacherCourse(_repository);
  }
}
