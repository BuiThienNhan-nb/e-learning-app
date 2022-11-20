// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VerifyEmailStore on _VerifyEmailStore, Store {
  Computed<BaseSate>? _$getCodeStateComputed;

  @override
  BaseSate get getCodeState =>
      (_$getCodeStateComputed ??= Computed<BaseSate>(() => super.getCodeState,
              name: '_VerifyEmailStore.getCodeState'))
          .value;

  late final _$verifyAtom =
      Atom(name: '_VerifyEmailStore.verify', context: context);

  @override
  bool? get verify {
    _$verifyAtom.reportRead();
    return super.verify;
  }

  @override
  set verify(bool? value) {
    _$verifyAtom.reportWrite(value, super.verify, () {
      super.verify = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_VerifyEmailStore.errorMessage', context: context);

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

  late final _$_verifyFutureAtom =
      Atom(name: '_VerifyEmailStore._verifyFuture', context: context);

  @override
  ObservableFuture<Either<Failure, bool>>? get _verifyFuture {
    _$_verifyFutureAtom.reportRead();
    return super._verifyFuture;
  }

  @override
  set _verifyFuture(ObservableFuture<Either<Failure, bool>>? value) {
    _$_verifyFutureAtom.reportWrite(value, super._verifyFuture, () {
      super._verifyFuture = value;
    });
  }

  late final _$verifyEmailAsyncAction =
      AsyncAction('_VerifyEmailStore.verifyEmail', context: context);

  @override
  Future<void> verifyEmail(String token) {
    return _$verifyEmailAsyncAction.run(() => super.verifyEmail(token));
  }

  @override
  String toString() {
    return '''
verify: ${verify},
errorMessage: ${errorMessage},
getCodeState: ${getCodeState}
    ''';
  }
}
