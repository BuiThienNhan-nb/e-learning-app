import 'package:e_learning_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/usecases/base_use_case.dart';
import 'package:e_learning_app/features/home/domain/entities/course_model.dart';
import 'package:e_learning_app/features/my_courses/domain/repositories/my_course_repository.dart';
import 'package:equatable/equatable.dart';

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
