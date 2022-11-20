import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../repositories/get_forgot_password_code_repository.dart';

@lazySingleton
class GetForgotPasswordCodeUseCase
    implements UseCase<bool, GetForgotPasswordCodeParams> {
  final GetForgotPasswordCodeRepository _repository;

  GetForgotPasswordCodeUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(
          GetForgotPasswordCodeParams params) async =>
      _repository.getResetPasswordCode(params.email);
}

class GetForgotPasswordCodeParams extends Equatable {
  final String email;

  const GetForgotPasswordCodeParams(this.email);

  @override
  List<Object?> get props => [email];
}
