import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/platform/network_status.dart';
import '../../../../../generated/translations/locale_keys.g.dart';
import '../../domain/repositories/get_forgot_password_code_repository.dart';
import '../datasources/get_forgot_password_code_data_source.dart';

@LazySingleton(as: GetForgotPasswordCodeRepository)
class GetForgotPasswordCodeRepositoryImp
    implements GetForgotPasswordCodeRepository {
  final GetForgotPasswordCodeDataSource dataSource;
  final NetworkStatus networkStatus;

  GetForgotPasswordCodeRepositoryImp(this.dataSource, this.networkStatus);

  @override
  Future<Either<Failure, bool>> getResetPasswordCode(String email) async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.getResetPasswordCode(email);
  }
}
