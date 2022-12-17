// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInStore on _SignInStore, Store {
  Computed<BaseSate>? _$stateComputed;

  @override
  BaseSate get state => (_$stateComputed ??=
          Computed<BaseSate>(() => super.state, name: '_SignInStore.state'))
      .value;

  late final _$userInfoAtom =
      Atom(name: '_SignInStore.userInfo', context: context);

  @override
  UserModel? get userInfo {
    _$userInfoAtom.reportRead();
    return super.userInfo;
  }

  @override
  set userInfo(UserModel? value) {
    _$userInfoAtom.reportWrite(value, super.userInfo, () {
      super.userInfo = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_SignInStore.errorMessage', context: context);

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

  late final _$_userFutureAtom =
      Atom(name: '_SignInStore._userFuture', context: context);

  @override
  ObservableFuture<Either<Failure, UserModel>>? get _userFuture {
    _$_userFutureAtom.reportRead();
    return super._userFuture;
  }

  @override
  set _userFuture(ObservableFuture<Either<Failure, UserModel>>? value) {
    _$_userFutureAtom.reportWrite(value, super._userFuture, () {
      super._userFuture = value;
    });
  }

  late final _$signInAsyncAction =
      AsyncAction('_SignInStore.signIn', context: context);

  @override
  Future<void> signIn(String email, String password) {
    return _$signInAsyncAction.run(() => super.signIn(email, password));
  }

  @override
  String toString() {
    return '''
userInfo: ${userInfo},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
