import 'package:e_learning_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/usecases/base_use_case.dart';
import 'package:e_learning_app/features/settings/domain/repositories/payment_repository.dart';

class GetPaymentUrl extends UseCase<String, NoParams> {
  final PaymentRepository repository;

  GetPaymentUrl(this.repository);

  @override
  Future<Either<Failure, String>> call(NoParams params) async =>
      repository.getPaymentUrl();
}
