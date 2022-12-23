// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentStore on _PaymentStore, Store {
  Computed<BaseSate>? _$stateComputed;

  @override
  BaseSate get state => (_$stateComputed ??=
          Computed<BaseSate>(() => super.state, name: '_PaymentStore.state'))
      .value;

  late final _$paymentUrlAtom =
      Atom(name: '_PaymentStore.paymentUrl', context: context);

  @override
  String? get paymentUrl {
    _$paymentUrlAtom.reportRead();
    return super.paymentUrl;
  }

  @override
  set paymentUrl(String? value) {
    _$paymentUrlAtom.reportWrite(value, super.paymentUrl, () {
      super.paymentUrl = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_PaymentStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$_paymentUrlFutureAtom =
      Atom(name: '_PaymentStore._paymentUrlFuture', context: context);

  @override
  ObservableFuture<Either<Failure, String>>? get _paymentUrlFuture {
    _$_paymentUrlFutureAtom.reportRead();
    return super._paymentUrlFuture;
  }

  @override
  set _paymentUrlFuture(ObservableFuture<Either<Failure, String>>? value) {
    _$_paymentUrlFutureAtom.reportWrite(value, super._paymentUrlFuture, () {
      super._paymentUrlFuture = value;
    });
  }

  late final _$getPaymentUrlAsyncAction =
      AsyncAction('_PaymentStore.getPaymentUrl', context: context);

  @override
  Future<void> getPaymentUrl(String path) {
    return _$getPaymentUrlAsyncAction.run(() => super.getPaymentUrl(path));
  }

  @override
  String toString() {
    return '''
paymentUrl: ${paymentUrl},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
