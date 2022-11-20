import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'dart:developer' as logger;

import '../../../../../bases/services/api_exception.dart';
import '../../../../../configs/env.dart';
import '../../../../../core/error/failures.dart';

abstract class ForgotPasswordDataSource {
  Future<Either<Failure, bool>> resetPassword(
    String newPasswordToken,
    String newPassword,
  );
}

@LazySingleton(as: ForgotPasswordDataSource)
class ForgotPasswordDataSourceImp extends Api
    implements ForgotPasswordDataSource {
  final String _resetPasswordEndpoint = "/auth/email/resetPassword";

  @override
  Future<Either<Failure, bool>> resetPassword(
    String newPasswordToken,
    String newPassword,
  ) async {
    final Map<String, String> requestData = {
      "newPasswordToken": newPasswordToken,
      "newPassword": newPassword,
    };

    try {
      final data = await post(
        Env.instance.baseUrl + _resetPasswordEndpoint,
        data: requestData,
        // options: Options(
        //   headers: {},
        // ),
      );

      logger.log(data.toString());

      return Right(
        (data["success"] ?? false) as bool,
      );
    } catch (e) {
      return Left(exceptionToFailure(e));
    }
  }
}
