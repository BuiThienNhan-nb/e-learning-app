import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/auth/verify_email/domain/repositories/verify_email_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';

@lazySingleton
class VerifyEmailUseCase implements UseCase<bool, VerifyEmailParams> {
  final VerifyEmailRepository _repository;

  VerifyEmailUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(VerifyEmailParams params) async =>
      _repository.verifyEmail(params.token);
}

class VerifyEmailParams extends Equatable {
  final String token;

  const VerifyEmailParams(this.token);

  @override
  List<Object?> get props => [token];
}
