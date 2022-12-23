import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_learning_app/bases/services/api_exception.dart';
import 'package:e_learning_app/configs/env.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/app/provider.dart';
import '../../../../core/error/failures.dart';

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
        "orderDescription": "77da51a6-fae1-48ef-aee0-260100849e70",
        "language": "vn"
      };

      final data = await post(
        Env.instance.baseUrl + _paymentEndpoint,
        data: requestData,
        options: Options(headers: {
          "Authorization": "Bearer ${GetIt.I<AppProvider>().accessToken}",
        }),
      );

      return Right((data["data"] ?? "") as String);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
