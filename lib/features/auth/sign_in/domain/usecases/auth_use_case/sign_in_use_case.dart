import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/error/failures.dart';
import '../../../../../../core/usecases/base_use_case.dart';
import '../../entities/user_model.dart';
import '../../repositories/auth_repository.dart';

class SignInUseCase implements UseCase<UserModel, SignInParams> {
  final AuthRepository _repository;

  SignInUseCase(this._repository);

  @override
  Future<Either<Failure, UserModel>> call(SignInParams p) async =>
      _repository.signIn(p.email, p.password);
}

class SignInParams extends Equatable {
  final String email;
  final String password;

  const SignInParams(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
