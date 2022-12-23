import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/platform/network_status.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../domain/repositories/payment_repository.dart';
import '../datasources/payment_repository_data_source.dart';

@LazySingleton(as: PaymentRepository)
class PaymentRepositoryImp implements PaymentRepository {
  final PaymentDataSource dataSource;
  final NetworkStatus networkStatus;

  PaymentRepositoryImp(
    this.dataSource,
    this.networkStatus,
  );

  @override
  Future<Either<Failure, String>> getPaymentUrl() async {
    if (!await networkStatus.isConnected) {
      return Left(
        UserFailure(
          LocaleKeys.connectivityException.tr(),
        ),
      );
    }

    return dataSource.getPaymentUrl();
  }
}
