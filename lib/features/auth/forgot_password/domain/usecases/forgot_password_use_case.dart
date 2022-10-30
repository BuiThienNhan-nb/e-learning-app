import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../repositories/forgot_password_repository.dart';

@lazySingleton
class ForgotPasswordUseCase implements UseCase<void, ForgotPasswordParams> {
  final ForgotPasswordRepository _repository;

  ForgotPasswordUseCase(this._repository);
  @override
  Future<Either<Failure, void>> call(ForgotPasswordParams params) async {
    return _repository.resetPassword(params.newPassword);
  }
}

class ForgotPasswordParams extends Equatable {
  final String newPassword;

  const ForgotPasswordParams(this.newPassword);

  @override
  List<Object?> get props => [newPassword];
}
