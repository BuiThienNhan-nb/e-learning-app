import 'package:e_learning_app/features/course_detail/domain/repositories/course_detail_repository.dart';
import 'package:e_learning_app/features/my_courses/domain/usecases/my_course_use_cases/update_course_use_case.dart';
import 'package:e_learning_app/features/my_courses/domain/usecases/my_course_use_cases/update_section_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../course_detail/domain/usecases/course_detail_use_case/get_course_detail_use_case.dart';
import '../repositories/my_course_repository.dart';
import 'my_course_use_cases/create_course_use_case.dart';

@lazySingleton
class MyCourseUseCase {
  final MyCourseRepository repository;
  final CourseDetailRepository courseDetailRepository;
  late final GetCourseDetailUseCase getCourseDetailUseCase;
  late final CreateCourse createCourse;
  late final UpdateCourse updateCourse;
  late final UpdateSection updateSection;

  MyCourseUseCase(
    this.repository,
    this.courseDetailRepository,
  ) {
    createCourse = CreateCourse(repository);
    getCourseDetailUseCase = GetCourseDetailUseCase(courseDetailRepository);
    updateCourse = UpdateCourse(repository);
    updateSection = UpdateSection(repository);
  }
}
