import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../../bases/mobx/base_state.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../generated/translations/locale_keys.g.dart';
import '../../../../auth/sign_in/domain/entities/user_model.dart';
import '../../../domain/usecases/update_profile_use_case.dart';

part 'edit_profile_store.g.dart';

@injectable
class EditProfileStore extends _EditProfileStore with _$EditProfileStore {
  EditProfileStore(super.useCase);
}

abstract class _EditProfileStore with Store {
  final UpdateProfileUseCase _useCase;

  _EditProfileStore(this._useCase);

  @observable
  UserModel? user;

  @observable
  String? errorMessage;

  @observable
  ObservableFuture<Either<Failure, UserModel>>? _updateProfile;

  @computed
  BaseSate get updateState {
    if (_updateProfile == null) {
      return BaseSate.init;
    }
    if (_updateProfile!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _updateProfile!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @action
  Future<void> updateProfile(UserModel user) async {
    errorMessage = null;

    _updateProfile = ObservableFuture(
      _useCase.call(
        UpdateProfileParams(user),
      ),
    );

    Either<Failure, UserModel>? userOrFailure = await _updateProfile;

    if (userOrFailure == null) {
      errorMessage = LocaleKeys.serverUnexpectedError.tr();
      return;
    }

    return userOrFailure.fold(
      (l) {
        (l is UserFailure || l is ServerFailure)
            ? errorMessage = l.message
            : errorMessage = LocaleKeys.serverUnexpectedError.tr();
      },
      (r) => this.user = r,
    );
  }
}
