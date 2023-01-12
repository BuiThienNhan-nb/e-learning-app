import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../core/app/provider.dart';
import '../../../../core/error/failures.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../domain/entities/exam_model.dart';
import '../../domain/usecases/create_exam_use_case.dart';
import '../../domain/usecases/create_exam_use_cases/create_exam.dart';
import '../../domain/usecases/create_exam_use_cases/get_exam.dart';

part 'create_exam_store.g.dart';

@injectable
class CreateExamStore extends _CreateExamStore with _$CreateExamStore {
  CreateExamStore(super.useCase);
}

abstract class _CreateExamStore with Store {
  final CreateExamUseCase _useCase;

  _CreateExamStore(this._useCase);

  @observable
  ExamModel? exam;

  @observable
  bool canCreate = true;

  @observable
  String? errorMessage;

  @observable
  ObservableFuture<Either<Failure, ExamModel?>>? _getExamFuture;

  @observable
  ObservableFuture<Either<Failure, ExamModel>>? _createExamFuture;

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

  @computed
  BaseSate get createState {
    if (_createExamFuture == null) {
      return BaseSate.init;
    }
    if (_createExamFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _createExamFuture!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @action
  void reInitCreateState() {
    _createExamFuture = null;
  }

  @action
  Future<void> getExam(String lessonId, String lessonTitle) async {
    errorMessage = null;

    _getExamFuture = ObservableFuture(
      _useCase.getExam(
        GetExamParams(lessonId),
      ),
    );

    Either<Failure, ExamModel?>? result = await _getExamFuture;

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
      (r) {
        if (r == null) {
          exam = ExamModel(
            lessonId: lessonId,
            lessonTitle: lessonTitle,
            examTitle: "$lessonTitle exam",
            userId: GetIt.I<AppProvider>().user.id,
            time: 10,
            questions: const [],
          );
        } else {
          exam = r;
          canCreate = false;
        }
      },
    );
  }

  @action
  Future<void> createExam(ExamModel examModel) async {
    errorMessage = null;

    _createExamFuture = ObservableFuture(
      _useCase.createExam(
        CreateExamParams(examModel),
      ),
    );

    Either<Failure, ExamModel>? result = await _createExamFuture;

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
