import 'package:injectable/injectable.dart';

import '../repositories/payment_repository.dart';
import 'payment_use_cases/get_payment_url.dart';

@lazySingleton
class PaymentUseCases {
  final PaymentRepository repository;
  late final GetPaymentUrl getPaymentUrl;

  PaymentUseCases(this.repository) {
    getPaymentUrl = GetPaymentUrl(repository);
  }
}
