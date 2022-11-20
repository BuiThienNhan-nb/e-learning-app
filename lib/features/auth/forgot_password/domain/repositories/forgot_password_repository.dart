import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';

abstract class ForgotPasswordRepository {
  Future<Either<Failure, bool>> resetPassword(
    String newPasswordToken,
    String newPassword,
  );
}
