import 'package:e_learning_app/core/error/failures.dart';

import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/platform/network_status.dart';
import 'package:e_learning_app/features/auth/forgot_password/data/datasources/forgot_password_data_source.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../../../../../generated/translations/locale_keys.g.dart';
import '../../domain/repositories/forgot_password_repository.dart';

@LazySingleton(as: ForgotPasswordRepository)
class ForgotPasswordRepositoryImp implements ForgotPasswordRepository {
  final ForgotPasswordDataSource dataSource;
  final NetworkStatus networkStatus;

  ForgotPasswordRepositoryImp(this.dataSource, this.networkStatus);

  @override
  Future<Either<Failure, void>> resetPassword(String newPassword) async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.resetPassword(newPassword);
  }
}
