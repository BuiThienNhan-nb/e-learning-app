import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error/failures.dart';

abstract class PaymentRepository {
  Future<Either<Failure, String>> getPaymentUrl();
}
