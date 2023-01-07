// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:e_learning_app/core/error/failures.dart';
import 'package:e_learning_app/core/usecases/base_use_case.dart';
import 'package:e_learning_app/features/auth/sign_in/domain/entities/user_model.dart';
import 'package:e_learning_app/features/course_detail/domain/repositories/course_detail_repository.dart';

class JoinCourse extends UseCase<UserModel, JoinCourseParams> {
  final CourseDetailRepository _repository;

  JoinCourse(this._repository);

  @override
  Future<Either<Failure, UserModel>> call(JoinCourseParams params) async =>
      _repository.enrollCourse(
        params.userId,
        params.courseId,
      );
}

class JoinCourseParams extends Equatable {
  final String userId;
  final String courseId;

  const JoinCourseParams(this.userId, this.courseId);

  @override
  List<Object?> get props => [
        userId,
        courseId,
      ];
}
