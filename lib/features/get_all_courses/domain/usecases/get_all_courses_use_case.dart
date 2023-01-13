import 'package:injectable/injectable.dart';

import '../repositories/get_all_courses_repository.dart';
import 'get_all_courses_use_case/get_all_courses.dart';

@lazySingleton
class GetAllCoursesUseCase {
  final GetAllCoursesRepository _repository;
  late final GetAllCourses getAllCourses;

  GetAllCoursesUseCase(this._repository) {
    getAllCourses = GetAllCourses(_repository);
  }
}
