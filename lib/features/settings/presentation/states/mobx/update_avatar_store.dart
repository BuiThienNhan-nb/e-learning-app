import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../../bases/mobx/base_state.dart';
import '../../../../../core/app/provider.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../generated/translations/locale_keys.g.dart';
import '../../../domain/usecases/upload_avatar_use_case.dart';

part 'update_avatar_store.g.dart';

@injectable
class UpdateAvatarStore extends _UpdateAvatarStore with _$UpdateAvatarStore {
  UpdateAvatarStore(super.updateAvatarUseCase);
}

abstract class _UpdateAvatarStore with Store {
  final UpdateAvatarUseCase _updateAvatarUseCase;

  _UpdateAvatarStore(this._updateAvatarUseCase);

  @observable
  bool? updated;

  @observable
  String? errorMessage;

  @observable
  ObservableFuture<Either<Failure, bool>>? _updateToFirebaseStorage;

  @computed
  BaseSate get updateState {
    if (_updateToFirebaseStorage == null) {
      return BaseSate.init;
    }
    if (_updateToFirebaseStorage!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _updateToFirebaseStorage!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @action
  Future<void> updateAvatar(String path) async {
    errorMessage = null;

    _updateToFirebaseStorage = ObservableFuture(
      _updateAvatarUseCase.call(
        UpdateAvatarParams(path),
      ),
    );

    Either<Failure, bool>? resetOrFailure = await _updateToFirebaseStorage;

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
      (r) => updated = r,
    );
  }

  @action
  Future<String> getAvatarDownloadUrl() async {
    return await FirebaseStorage.instance
        .ref()
        .child("images/users/avatar/${GetIt.I<AppProvider>().user.id}")
        .getDownloadURL();
  }
}
