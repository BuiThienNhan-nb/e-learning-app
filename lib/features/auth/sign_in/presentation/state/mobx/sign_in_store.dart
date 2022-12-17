import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../bases/mobx/base_state.dart';
import '../../../../../../core/error/failures.dart';
import '../../../../../../generated/translations/locale_keys.g.dart';
import '../../../domain/entities/user_model.dart';
import '../../../domain/usecases/auth_use_case.dart';
import '../../../domain/usecases/auth_use_case/sign_in_use_case.dart';

part 'sign_in_store.g.dart';

@injectable
class SignInStore extends _SignInStore with _$SignInStore {
  SignInStore(AuthUseCase authUseCase) : super(authUseCase);
}

abstract class _SignInStore with Store {
  final AuthUseCase _authUseCase;

  _SignInStore(this._authUseCase);

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
  Future<void> signIn(String email, String password) async {
    errorMessage = null;

    _userFuture = ObservableFuture(
      _authUseCase.signInUseCase(
        SignInParams(email, password),
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
