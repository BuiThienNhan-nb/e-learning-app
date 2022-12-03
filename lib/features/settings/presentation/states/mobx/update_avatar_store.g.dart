// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_avatar_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UpdateAvatarStore on _UpdateAvatarStore, Store {
  Computed<BaseSate>? _$updateStateComputed;

  @override
  BaseSate get updateState =>
      (_$updateStateComputed ??= Computed<BaseSate>(() => super.updateState,
              name: '_UpdateAvatarStore.updateState'))
          .value;

  late final _$updatedAtom =
      Atom(name: '_UpdateAvatarStore.updated', context: context);

  @override
  bool? get updated {
    _$updatedAtom.reportRead();
    return super.updated;
  }

  @override
  set updated(bool? value) {
    _$updatedAtom.reportWrite(value, super.updated, () {
      super.updated = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_UpdateAvatarStore.errorMessage', context: context);

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

  late final _$_updateToFirebaseStorageAtom = Atom(
      name: '_UpdateAvatarStore._updateToFirebaseStorage', context: context);

  @override
  ObservableFuture<Either<Failure, bool>>? get _updateToFirebaseStorage {
    _$_updateToFirebaseStorageAtom.reportRead();
    return super._updateToFirebaseStorage;
  }

  @override
  set _updateToFirebaseStorage(ObservableFuture<Either<Failure, bool>>? value) {
    _$_updateToFirebaseStorageAtom
        .reportWrite(value, super._updateToFirebaseStorage, () {
      super._updateToFirebaseStorage = value;
    });
  }

  late final _$updateAvatarAsyncAction =
      AsyncAction('_UpdateAvatarStore.updateAvatar', context: context);

  @override
  Future<void> updateAvatar(String path) {
    return _$updateAvatarAsyncAction.run(() => super.updateAvatar(path));
  }

  late final _$getAvatarDownloadUrlAsyncAction =
      AsyncAction('_UpdateAvatarStore.getAvatarDownloadUrl', context: context);

  @override
  Future<String> getAvatarDownloadUrl() {
    return _$getAvatarDownloadUrlAsyncAction
        .run(() => super.getAvatarDownloadUrl());
  }

  @override
  String toString() {
    return '''
updated: ${updated},
errorMessage: ${errorMessage},
updateState: ${updateState}
    ''';
  }
}
