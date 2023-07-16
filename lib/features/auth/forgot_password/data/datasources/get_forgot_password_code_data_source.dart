import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../bases/services/api_exception.dart';
import '../../../../../configs/env.dart';
import '../../../../../core/error/failures.dart';

abstract class GetForgotPasswordCodeDataSource {
  Future<Either<Failure, bool>> getResetPasswordCode(String email);
}

@LazySingleton(as: GetForgotPasswordCodeDataSource)
class GetForgotPasswordCodeDataSourceImp extends Api
    implements GetForgotPasswordCodeDataSource {
  final String _getResetPasswordCodeEndpoint =
      "/auth/email/getCodeResetPassword";

  @override
  Future<Either<Failure, bool>> getResetPasswordCode(String email) async {
    final Map<String, String> requestData = {
      "email": email,
    };

    try {
      final data = await post(
        Env.instance.baseUrl + _getResetPasswordCodeEndpoint,
        data: requestData,
      );

      if (data["success"] == false) {
        throw Exception(
            "Oops! It seems you've attempted to send tokens to multiple email addresses simultaneously. Check your email once again or wait for a minute then try resend again! Thank you for your understanding and cooperation.");
      }

      return Right(
        (data["success"] ?? false) as bool,
      );
    } catch (e) {
      return Left(exceptionToFailure(e.toString()));
    }
  }
}
