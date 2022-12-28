import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../../../home/domain/entities/section_model.dart';
import '../../repositories/my_course_repository.dart';

class UpdateSection extends UseCase<SectionModel, UpdateSectionParams> {
  final MyCourseRepository _repository;

  UpdateSection(this._repository);

  @override
  Future<Either<Failure, SectionModel>> call(
          UpdateSectionParams params) async =>
      _repository.updateCourseSection(
        params.section,
        params.courseId,
      );
}

class UpdateSectionParams extends Equatable {
  final SectionModel section;
  final String courseId;

  const UpdateSectionParams(
    this.section,
    this.courseId,
  );

  @override
  List<Object?> get props => [
        section,
        courseId,
      ];
}
