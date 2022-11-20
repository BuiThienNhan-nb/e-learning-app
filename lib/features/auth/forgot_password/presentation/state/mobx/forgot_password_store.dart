import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/auth/forgot_password/domain/usecases/forgot_password_use_case.dart';
import 'package:e_learning_app/features/auth/forgot_password/domain/usecases/get_forgot_password_code_use_case.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../bases/mobx/base_state.dart';
import '../../../../../../core/error/failures.dart';
import '../../../../../../generated/translations/locale_keys.g.dart';

part 'forgot_password_store.g.dart';

@injectable
class ForgotPasswordStore extends _ForgotPasswordStore
    with _$ForgotPasswordStore {
  ForgotPasswordStore(super.resetPasswordUseCase, super.getCodeUseCase);
}

abstract class _ForgotPasswordStore with Store {
  final ForgotPasswordUseCase _resetPasswordUseCase;
  final GetForgotPasswordCodeUseCase _getCodeUseCase;

  _ForgotPasswordStore(this._resetPasswordUseCase, this._getCodeUseCase);

  // @observable
  // UserInfo? userInfo;

  @observable
  bool? code;

  @observable
  bool? reset;

  @observable
  String? errorMessage;

  @observable
  ObservableFuture<Either<Failure, bool>>? _resetPasswordFuture;

  @observable
  ObservableFuture<Either<Failure, bool>>? _getCodeFuture;

  @computed
  BaseSate get getCodeState {
    if (_getCodeFuture == null) {
      return BaseSate.init;
    }
    if (_getCodeFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _getCodeFuture!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @computed
  BaseSate get resetPasswordState {
    if (_resetPasswordFuture == null) {
      return BaseSate.init;
    }
    if (_resetPasswordFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _resetPasswordFuture!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @action
  Future<void> getCode(String email) async {
    errorMessage = null;

    _getCodeFuture = ObservableFuture(
      _getCodeUseCase.call(
        GetForgotPasswordCodeParams(email),
      ),
    );

    Either<Failure, bool>? codeOrFailure = await _getCodeFuture;

    if (codeOrFailure == null) {
      errorMessage = LocaleKeys.serverUnexpectedError.tr();
      return;
    }

    return codeOrFailure.fold(
      (l) {
        (l is UserFailure || l is ServerFailure)
            ? errorMessage = l.message
            : errorMessage = LocaleKeys.serverUnexpectedError.tr();
      },
      (r) => code = r,
    );
  }

  @action
  Future<void> resetPassword(
    String newPasswordToken,
    String newPassword,
  ) async {
    errorMessage = null;

    _resetPasswordFuture = ObservableFuture(
      _resetPasswordUseCase.call(
        ForgotPasswordParams(
          newPasswordToken,
          newPassword,
        ),
      ),
    );

    Either<Failure, bool>? resetOrFailure = await _resetPasswordFuture;

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
      (r) => code = r,
    );
  }
}
