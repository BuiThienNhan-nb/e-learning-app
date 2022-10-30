import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error/failures.dart';
import 'package:injectable/injectable.dart';

abstract class ForgotPasswordDataSource {
  Future<Either<Failure, void>> resetPassword(String newPassword);
}

@LazySingleton(as: ForgotPasswordDataSource)
class ForgotPasswordDataSourceImp implements ForgotPasswordDataSource {
  @override
  Future<Either<Failure, void>> resetPassword(String newPassword) {
    throw UnimplementedError();
  }
}
