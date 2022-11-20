import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';

abstract class GetForgotPasswordCodeRepository {
  Future<Either<Failure, bool>> getResetPasswordCode(String email);
}
