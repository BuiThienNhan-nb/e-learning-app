import 'package:dartz/dartz.dart';
import 'package:e_learning_app/bases/mobx/base_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../generated/translations/locale_keys.g.dart';
import '../../../domain/entities/user_info.dart';
import '../../../domain/usecases/auth_use_case.dart';
import '../../../domain/usecases/auth_use_case/sign_in_use_case.dart';

part 'auth_store.g.dart';

class AuthStore extends _AuthStore with _$AuthStore {
  AuthStore(AuthUseCase authUseCase) : super(authUseCase);
}

abstract class _AuthStore with Store {
  final AuthUseCase _authUseCase;

  _AuthStore(this._authUseCase);

  @observable
  UserInfo? userInfo;

  @observable
  String? errorMessage;

  @observable
  ObservableFuture<Either<Failure, UserInfo>>? _userFuture;

  @computed
  BaseSate get state {
    if (_userFuture == null) {
      return BaseSate.init;
    }
    if (_userFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _userFuture!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @action
  Future<void> signIn(String email, String password) async {
    errorMessage = null;

    _userFuture = ObservableFuture(
      _authUseCase.signInUseCase(
        SignInParams(email, password),
      ),
    );

    Either<Failure, UserInfo>? userOrFailure = await _userFuture;

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
      (r) => userInfo = r,
    );
  }
}
