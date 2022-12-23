import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/usecases/base_use_case.dart';
import 'package:e_learning_app/features/settings/domain/usecases/payment_use_cases.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../../bases/mobx/base_state.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../generated/translations/locale_keys.g.dart';

part 'payment_store.g.dart';

@injectable
class PaymentStore extends _PaymentStore with _$PaymentStore {
  PaymentStore(super.useCases);
}

abstract class _PaymentStore with Store {
  final PaymentUseCases _useCases;

  _PaymentStore(this._useCases);

  @observable
  String? paymentUrl;

  @observable
  String? errorMessage;

  @observable
  ObservableFuture<Either<Failure, String>>? _paymentUrlFuture;

  @computed
  BaseSate get state {
    if (_paymentUrlFuture == null) {
      return BaseSate.init;
    }
    if (_paymentUrlFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _paymentUrlFuture!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @action
  Future<void> getPaymentUrl(String path) async {
    errorMessage = null;

    _paymentUrlFuture = ObservableFuture(
      _useCases.getPaymentUrl(NoParams()),
    );

    Either<Failure, String>? resetOrFailure = await _paymentUrlFuture;

    if (resetOrFailure == null) {
      errorMessage = LocaleKeys.serverUnexpectedError.tr();
      return;
    }

    return resetOrFailure.fold(
      (l) {
        (l is UserFailure || l is ServerFailure)
            ? errorMessage = l.message
            : errorMessage = LocaleKeys.serverUnexpectedError.tr();
      },
      (r) => paymentUrl = r,
    );
  }
}
