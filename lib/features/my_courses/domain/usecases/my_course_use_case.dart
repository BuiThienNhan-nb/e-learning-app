import 'package:injectable/injectable.dart';

import '../repositories/my_course_repository.dart';
import 'my_course_use_cases/create_course_use_case.dart';

@lazySingleton
class MyCourseUseCase {
  final MyCourseRepository repository;
  late final CreateCourse createCourse;

  MyCourseUseCase(this.repository) {
    createCourse = CreateCourse(repository);
  }
}
