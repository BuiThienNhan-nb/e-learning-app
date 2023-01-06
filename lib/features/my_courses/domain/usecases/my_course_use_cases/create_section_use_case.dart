import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../../../home/domain/entities/section_model.dart';
import '../../repositories/my_course_repository.dart';

class CreateSection extends UseCase<SectionModel, CreateSectionParams> {
  final MyCourseRepository _repository;

  CreateSection(this._repository);

  @override
  Future<Either<Failure, SectionModel>> call(
          CreateSectionParams params) async =>
      _repository.createCourseSection(
        params.section,
        params.courseId,
      );
}

class CreateSectionParams extends Equatable {
  final SectionModel section;
  final String courseId;

  const CreateSectionParams(
    this.section,
    this.courseId,
  );

  @override
  List<Object?> get props => [
        section,
        courseId,
      ];
}
