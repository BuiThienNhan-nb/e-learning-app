import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../repositories/my_course_repository.dart';

class DeleteSection extends UseCase<bool, DeleteSectionParams> {
  final MyCourseRepository _repository;

  DeleteSection(this._repository);

  @override
  Future<Either<Failure, bool>> call(DeleteSectionParams params) async =>
      _repository.deleteSection(
        params.courseId,
        params.sectionId,
      );
}

class DeleteSectionParams extends Equatable {
  final String courseId;
  final String sectionId;

  const DeleteSectionParams(this.courseId, this.sectionId);

  @override
  List<Object?> get props => [courseId, sectionId];
}
