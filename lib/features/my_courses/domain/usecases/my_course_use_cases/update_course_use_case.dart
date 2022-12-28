import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../../../home/domain/entities/course_model.dart';
import '../../repositories/my_course_repository.dart';

class UpdateCourse extends UseCase<CourseModel, UpdateCourseParams> {
  final MyCourseRepository _repository;

  UpdateCourse(this._repository);

  @override
  Future<Either<Failure, CourseModel>> call(UpdateCourseParams params) async =>
      _repository.updateCourseInformation(params.course, params.isUpdateImage);
}

class UpdateCourseParams extends Equatable {
  final CourseModel course;
  final bool isUpdateImage;

  const UpdateCourseParams(this.course, this.isUpdateImage);

  @override
  List<Object?> get props => [course, isUpdateImage];
}
