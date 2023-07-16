import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../../../top/domain/entities/course_model.dart';
import '../../repositories/enrolled_course_repository.dart';

class GetCourseByListId
    extends UseCase<List<CourseModel>, GetCourseByListIdParams> {
  final EnrolledCourseRepository _repository;

  GetCourseByListId(this._repository);

  @override
  Future<Either<Failure, List<CourseModel>>> call(
          GetCourseByListIdParams params) =>
      _repository.getCourseByListId(params.listId);
}

class GetCourseByListIdParams extends Equatable {
  final List<String> listId;

  const GetCourseByListIdParams(this.listId);

  @override
  List<Object?> get props => [listId];
}
