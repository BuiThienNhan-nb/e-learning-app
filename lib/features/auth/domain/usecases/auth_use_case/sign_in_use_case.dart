import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/auth/domain/entities/user_info.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../repositories/auth_repository.dart';

class SignInUseCase implements UseCase<UserInfo, SignInParams> {
  final AuthRepository _repository;

  SignInUseCase(this._repository);

  @override
  Future<Either<Failure, UserInfo>> call(SignInParams p) async =>
      _repository.signIn(p.email, p.password);
}

class SignInParams extends Equatable {
  final String email;
  final String password;

  const SignInParams(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
