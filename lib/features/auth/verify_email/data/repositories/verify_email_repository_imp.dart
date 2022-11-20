import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/auth/verify_email/data/datasources/verify_email_data_source.dart';
import 'package:e_learning_app/features/auth/verify_email/domain/repositories/verify_email_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/platform/network_status.dart';
import '../../../../../generated/translations/locale_keys.g.dart';

@LazySingleton(as: VerifyEmailRepository)
class VerifyEmailRepositoryImp implements VerifyEmailRepository {
  final VerifyEmailDataSource dataSource;
  final NetworkStatus networkStatus;

  VerifyEmailRepositoryImp(this.dataSource, this.networkStatus);

  @override
  Future<Either<Failure, bool>> verifyEmail(String token) async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.verifyEmail(token);
  }
}
