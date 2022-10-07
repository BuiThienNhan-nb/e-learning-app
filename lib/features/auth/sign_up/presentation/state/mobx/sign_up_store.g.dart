// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpStore on _SignUpStore, Store {
  Computed<BaseSate>? _$stateComputed;

  @override
  BaseSate get state => (_$stateComputed ??=
          Computed<BaseSate>(() => super.state, name: '_SignUpStore.state'))
      .value;

  late final _$userInfoAtom =
      Atom(name: '_SignUpStore.userInfo', context: context);

  @override
  UserInfo? get userInfo {
    _$userInfoAtom.reportRead();
    return super.userInfo;
  }

  @override
  set userInfo(UserInfo? value) {
    _$userInfoAtom.reportWrite(value, super.userInfo, () {
      super.userInfo = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_SignUpStore.errorMessage', context: context);

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
      Atom(name: '_SignUpStore._userFuture', context: context);

  @override
  ObservableFuture<Either<Failure, UserInfo>>? get _userFuture {
    _$_userFutureAtom.reportRead();
    return super._userFuture;
  }

  @override
  set _userFuture(ObservableFuture<Either<Failure, UserInfo>>? value) {
    _$_userFutureAtom.reportWrite(value, super._userFuture, () {
      super._userFuture = value;
    });
  }

  late final _$signUpAsyncAction =
      AsyncAction('_SignUpStore.signUp', context: context);

  @override
  Future<void> signUp(
      {required String name,
      required String email,
      required String password,
      required String? phoneNumber,
      required DateTime birthday,
      required String gender,
      required String role}) {
    return _$signUpAsyncAction.run(() => super.signUp(
        name: name,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        birthday: birthday,
        gender: gender,
        role: role));
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
