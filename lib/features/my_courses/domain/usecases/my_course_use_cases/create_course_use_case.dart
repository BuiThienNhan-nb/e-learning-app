import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../../../top/domain/entities/course_model.dart';
import '../../repositories/my_course_repository.dart';

class CreateCourse extends UseCase<CourseModel, CreateCourseParams> {
  final MyCourseRepository _repository;

  CreateCourse(this._repository);

  @override
  Future<Either<Failure, CourseModel>> call(CreateCourseParams params) async =>
      _repository.createCourse(params.course);
}

class CreateCourseParams extends Equatable {
  final CourseModel course;

  const CreateCourseParams(this.course);

  @override
  List<Object?> get props => [course];
}
