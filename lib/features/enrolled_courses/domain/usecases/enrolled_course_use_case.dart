import 'package:injectable/injectable.dart';

import '../repositories/enrolled_course_repository.dart';
import 'enrolled_course_use_case/get_course_by_list_id.dart';

@lazySingleton
class EnrolledCourseUseCase {
  final EnrolledCourseRepository _repository;
  late final GetCourseByListId getCourseByListId;

  EnrolledCourseUseCase(this._repository) {
    getCourseByListId = GetCourseByListId(_repository);
  }
}
