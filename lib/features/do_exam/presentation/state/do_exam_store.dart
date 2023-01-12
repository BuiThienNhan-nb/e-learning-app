import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../core/error/failures.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../../create_exam/domain/entities/exam_model.dart';
import '../../../create_exam/domain/usecases/create_exam_use_cases/get_exam.dart';
import '../../domain/usecases/do_exam_use_case.dart';

part 'do_exam_store.g.dart';

@injectable
class DoExamStore extends _DoExamStore with _$DoExamStore {
  DoExamStore(super.useCase);
}

abstract class _DoExamStore with Store {
  final DoExamUseCase _useCase;

  _DoExamStore(this._useCase);

  @observable
  ExamModel? exam;

  @observable
  String? errorMessage;

  @observable
  ObservableFuture<Either<Failure, ExamModel>>? _getExamFuture;

  @computed
  BaseSate get getState {
    if (_getExamFuture == null) {
      return BaseSate.init;
    }
    if (_getExamFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _getExamFuture!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @action
  Future<void> getExam(String lessonId) async {
    errorMessage = null;

    _getExamFuture = ObservableFuture(
      _useCase.getExam(
        GetExamParams(lessonId),
      ),
    );

    Either<Failure, ExamModel>? result = await _getExamFuture;

    if (result == null) {
      errorMessage = LocaleKeys.serverUnexpectedError.tr();
      return;
    }

    return result.fold(
      (l) {
        (l is UserFailure || l is ServerFailure)
            ? errorMessage = l.message
            : errorMessage = LocaleKeys.serverUnexpectedError.tr();
      },
      (r) => exam = r,
    );
  }
}
