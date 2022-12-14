import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../bases/mobx/base_state.dart';
import '../../../../../../core/error/failures.dart';
import '../../../../../../generated/translations/locale_keys.g.dart';
import '../../../../sign_in/domain/entities/user_model.dart';
import '../../../../sign_in/domain/usecases/auth_use_case.dart';
import '../../../../sign_in/domain/usecases/auth_use_case/sign_up_use_case.dart';

part 'sign_up_store.g.dart';

@injectable
class SignUpStore extends _SignUpStore with _$SignUpStore {
  SignUpStore(super.authUseCase);
}

abstract class _SignUpStore with Store {
  final AuthUseCase _authUseCase;

  _SignUpStore(this._authUseCase);

  @observable
  UserModel? userInfo;

  @observable
  String? errorMessage;

  @observable
  ObservableFuture<Either<Failure, UserModel>>? _userFuture;

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
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required String? phoneNumber,
    required String birthday,
    required String gender,
    required String role,
  }) async {
    errorMessage = null;

    _userFuture = ObservableFuture(
      _authUseCase.signUpUseCase(
        SignUpParams(
          name,
          email,
          password,
          phoneNumber,
          null,
          birthday,
          gender,
          role,
        ),
      ),
    );

    Either<Failure, UserModel>? userOrFailure = await _userFuture;

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
