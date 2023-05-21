import 'package:e_learning_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/usecases/base_use_case.dart';
import 'package:e_learning_app/features/auth/sign_in/domain/entities/user_model.dart';
import 'package:e_learning_app/features/auth/sign_in/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class GetUserByIdUseCase extends UseCase<UserModel, GetUserByIdParams> {
  final AuthRepository _repository;

  GetUserByIdUseCase(this._repository);

  @override
  Future<Either<Failure, UserModel>> call(GetUserByIdParams params) async {
    return _repository.getUserById(params.userId);
  }
}

class GetUserByIdParams extends Equatable {
  final String userId;

  const GetUserByIdParams(this.userId);

  @override
  List<Object?> get props => [userId];
}
