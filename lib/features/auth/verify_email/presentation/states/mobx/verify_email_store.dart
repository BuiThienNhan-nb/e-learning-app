import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/auth/verify_email/domain/usecases/verify_email_use_case.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../bases/mobx/base_state.dart';
import '../../../../../../core/error/failures.dart';
import '../../../../../../generated/translations/locale_keys.g.dart';

part 'verify_email_store.g.dart';

@injectable
class VerifyEmailStore extends _VerifyEmailStore with _$VerifyEmailStore {
  VerifyEmailStore(super.useCase);
}

abstract class _VerifyEmailStore with Store {
  final VerifyEmailUseCase _useCase;

  _VerifyEmailStore(this._useCase);

  @observable
  bool? verify;

  @observable
  String? errorMessage;

  @observable
  ObservableFuture<Either<Failure, bool>>? _verifyFuture;

  @computed
  BaseSate get getCodeState {
    if (_verifyFuture == null) {
      return BaseSate.init;
    }
    if (_verifyFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _verifyFuture!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @action
  Future<void> verifyEmail(String token) async {
    errorMessage = null;

    _verifyFuture = ObservableFuture(
      _useCase.call(
        VerifyEmailParams(token),
      ),
    );

    Either<Failure, bool>? codeOrFailure = await _verifyFuture;

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
      (r) => verify = r,
    );
  }
}
