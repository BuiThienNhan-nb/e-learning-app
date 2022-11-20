import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error/failures.dart';

abstract class VerifyEmailRepository {
  Future<Either<Failure, bool>> verifyEmail(String token);
}
