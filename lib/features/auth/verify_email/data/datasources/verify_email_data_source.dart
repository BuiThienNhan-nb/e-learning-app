import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../bases/services/api_exception.dart';
import '../../../../../configs/env.dart';
import '../../../../../core/error/failures.dart';

abstract class VerifyEmailDataSource {
  Future<Either<Failure, bool>> verifyEmail(String token);
}

@LazySingleton(as: VerifyEmailDataSource)
class VerifyEmailDataSourceImp extends Api implements VerifyEmailDataSource {
  final String _verifyEmailEndPoint = "/auth/email/verify/";

  @override
  Future<Either<Failure, bool>> verifyEmail(String token) async {
    try {
      print(Env.instance.baseUrl + _verifyEmailEndPoint + token);

      final data = await get(
        Env.instance.baseUrl + _verifyEmailEndPoint + token,
      );

      print(data.toString());

      return Right(
        (data["success"] ?? false) as bool,
      );
    } catch (e) {
      return Left(exceptionToFailure(e));
    }
  }
}
