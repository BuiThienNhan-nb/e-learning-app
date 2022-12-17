import 'package:e_learning_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/usecases/base_use_case.dart';
import 'package:e_learning_app/features/course_detail/domain/entities/course_detail_model.dart';
import 'package:e_learning_app/features/course_detail/domain/repositories/course_detail_repository.dart';
import 'package:equatable/equatable.dart';

class GetCourseDetailUseCase
    extends UseCase<CourseDetailModel, GetCourseDetailParams> {
  final CourseDetailRepository repository;

  GetCourseDetailUseCase(this.repository);

  @override
  Future<Either<Failure, CourseDetailModel>> call(
          GetCourseDetailParams params) async =>
      repository.getCourseDetail(params.courseId);
}

class GetCourseDetailParams extends Equatable {
  final String courseId;

  const GetCourseDetailParams(this.courseId);

  @override
  List<Object?> get props => [courseId];
}
