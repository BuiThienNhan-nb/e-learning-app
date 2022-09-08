import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../entities/user_info.dart';
import '../../repositories/auth_repository.dart';

class SignUpUseCase implements UseCase<void, SignUpParams> {
  final AuthRepository _repository;

  SignUpUseCase(this._repository);

  @override
  Future<Either<Failure, UserInfo>> call(SignUpParams p) async =>
      await _repository.signUp(
        name: p.name,
        email: p.email,
        password: p.password,
        birthday: p.birthday,
        avatar: p.avatar,
        phoneNumber: p.phoneNumber,
      );
}

class SignUpParams extends Equatable {
  final String name;
  final String email;
  final String password;
  final String? phoneNumber;
  final String? avatar;
  final DateTime birthday;

  const SignUpParams(
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.avatar,
    this.birthday,
  );

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        phoneNumber,
        avatar,
        birthday,
      ];
}
