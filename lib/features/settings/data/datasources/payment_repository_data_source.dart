import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_learning_app/bases/services/api_exception.dart';
import 'package:e_learning_app/configs/env.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/app/provider.dart';
import '../../../../core/error/failures.dart';
import '../../../auth/sign_in/data/local/datasources/auth_local_data_source.dart';

abstract class PaymentDataSource {
  Future<Either<Failure, String>> getPaymentUrl();
}

@LazySingleton(as: PaymentDataSource)
class PaymentDataSourceImp extends Api implements PaymentDataSource {
  final _paymentEndpoint = "/create_payment_url";

  @override
  Future<Either<Failure, String>> getPaymentUrl() async {
    try {
      final Map<String, String> requestData = {
        "amount": "10000",
        "orderDescription": GetIt.I<AppProvider>().user.id,
        "orderType": "other",
        "language": "vn"
      };

      final data = await post(
        Env.instance.baseUrl + _paymentEndpoint,
        data: requestData,
        options: Options(headers: {
          "Authorization":
              "Bearer ${GetIt.I<AuthLocalDataSource>().getAccessToken()}",
        }),
      );

      return Right((data["data"] ?? "") as String);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
