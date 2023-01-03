// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditProfileStore on _EditProfileStore, Store {
  Computed<BaseSate>? _$updateStateComputed;

  @override
  BaseSate get updateState =>
      (_$updateStateComputed ??= Computed<BaseSate>(() => super.updateState,
              name: '_EditProfileStore.updateState'))
          .value;

  late final _$userAtom =
      Atom(name: '_EditProfileStore.user', context: context);

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_EditProfileStore.errorMessage', context: context);

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

  late final _$_updateProfileAtom =
      Atom(name: '_EditProfileStore._updateProfile', context: context);

  @override
  ObservableFuture<Either<Failure, UserModel>>? get _updateProfile {
    _$_updateProfileAtom.reportRead();
    return super._updateProfile;
  }

  @override
  set _updateProfile(ObservableFuture<Either<Failure, UserModel>>? value) {
    _$_updateProfileAtom.reportWrite(value, super._updateProfile, () {
      super._updateProfile = value;
    });
  }

  late final _$updateProfileAsyncAction =
      AsyncAction('_EditProfileStore.updateProfile', context: context);

  @override
  Future<void> updateProfile(UserModel user) {
    return _$updateProfileAsyncAction.run(() => super.updateProfile(user));
  }

  @override
  String toString() {
    return '''
user: ${user},
errorMessage: ${errorMessage},
updateState: ${updateState}
    ''';
  }
}
