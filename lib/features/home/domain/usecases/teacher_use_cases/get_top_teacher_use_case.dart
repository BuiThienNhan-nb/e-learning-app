import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error/failures.dart';
import 'package:e_learning_app/core/usecases/base_use_case.dart';
import 'package:e_learning_app/features/home/domain/repositories/get_top_teacher_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../auth/sign_in/domain/entities/teacher_model.dart';

@lazySingleton
class GetTopTeachersUseCase extends UseCase<List<TeacherModel>, NoParams> {
  final GetTopTeachersRepository _repository;

  GetTopTeachersUseCase(this._repository);

  @override
  Future<Either<Failure, List<TeacherModel>>> call(NoParams params) async {
    return _repository.getTopTeachers();
  }
}
