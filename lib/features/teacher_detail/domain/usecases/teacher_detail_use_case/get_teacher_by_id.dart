import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../../../auth/sign_in/domain/entities/teacher_model.dart';
import '../../repositories/teacher_detail_repository.dart';

class GetTeacherById extends UseCase<TeacherModel, GetTeacherByIdParams> {
  final TeacherDetailRepository _repository;

  GetTeacherById(this._repository);

  @override
  Future<Either<Failure, TeacherModel>> call(
          GetTeacherByIdParams params) async =>
      _repository.getTeacherById(params.teacherId);
}

class GetTeacherByIdParams extends Equatable {
  final String teacherId;

  const GetTeacherByIdParams(this.teacherId);

  @override
  List<Object?> get props => [teacherId];
}
