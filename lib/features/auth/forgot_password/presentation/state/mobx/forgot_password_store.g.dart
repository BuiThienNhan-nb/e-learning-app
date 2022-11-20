// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ForgotPasswordStore on _ForgotPasswordStore, Store {
  Computed<BaseSate>? _$getCodeStateComputed;

  @override
  BaseSate get getCodeState =>
      (_$getCodeStateComputed ??= Computed<BaseSate>(() => super.getCodeState,
              name: '_ForgotPasswordStore.getCodeState'))
          .value;
  Computed<BaseSate>? _$resetPasswordStateComputed;

  @override
  BaseSate get resetPasswordState => (_$resetPasswordStateComputed ??=
          Computed<BaseSate>(() => super.resetPasswordState,
              name: '_ForgotPasswordStore.resetPasswordState'))
      .value;

  late final _$codeAtom =
      Atom(name: '_ForgotPasswordStore.code', context: context);

  @override
  bool? get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(bool? value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  late final _$resetAtom =
      Atom(name: '_ForgotPasswordStore.reset', context: context);

  @override
  bool? get reset {
    _$resetAtom.reportRead();
    return super.reset;
  }

  @override
  set reset(bool? value) {
    _$resetAtom.reportWrite(value, super.reset, () {
      super.reset = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_ForgotPasswordStore.errorMessage', context: context);

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

  late final _$_resetPasswordFutureAtom =
      Atom(name: '_ForgotPasswordStore._resetPasswordFuture', context: context);

  @override
  ObservableFuture<Either<Failure, bool>>? get _resetPasswordFuture {
    _$_resetPasswordFutureAtom.reportRead();
    return super._resetPasswordFuture;
  }

  @override
  set _resetPasswordFuture(ObservableFuture<Either<Failure, bool>>? value) {
    _$_resetPasswordFutureAtom.reportWrite(value, super._resetPasswordFuture,
        () {
      super._resetPasswordFuture = value;
    });
  }

  late final _$_getCodeFutureAtom =
      Atom(name: '_ForgotPasswordStore._getCodeFuture', context: context);

  @override
  ObservableFuture<Either<Failure, bool>>? get _getCodeFuture {
    _$_getCodeFutureAtom.reportRead();
    return super._getCodeFuture;
  }

  @override
  set _getCodeFuture(ObservableFuture<Either<Failure, bool>>? value) {
    _$_getCodeFutureAtom.reportWrite(value, super._getCodeFuture, () {
      super._getCodeFuture = value;
    });
  }

  late final _$getCodeAsyncAction =
      AsyncAction('_ForgotPasswordStore.getCode', context: context);

  @override
  Future<void> getCode(String email) {
    return _$getCodeAsyncAction.run(() => super.getCode(email));
  }

  late final _$resetPasswordAsyncAction =
      AsyncAction('_ForgotPasswordStore.resetPassword', context: context);

  @override
  Future<void> resetPassword(String newPasswordToken, String newPassword) {
    return _$resetPasswordAsyncAction
        .run(() => super.resetPassword(newPasswordToken, newPassword));
  }

  @override
  String toString() {
    return '''
code: ${code},
reset: ${reset},
errorMessage: ${errorMessage},
getCodeState: ${getCodeState},
resetPasswordState: ${resetPasswordState}
    ''';
  }
}
