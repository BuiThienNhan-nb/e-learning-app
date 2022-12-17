import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/lesson_detail/domain/entities/lesson_comment_model.dart';
import 'package:e_learning_app/features/lesson_detail/domain/usecases/get_lesson_comments_ues_case.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../../bases/mobx/base_state.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../generated/translations/locale_keys.g.dart';

part 'lesson_comments_store.g.dart';

@injectable
class LessonCommentsStore extends _LessonCommentsStore
    with _$LessonCommentsStore {
  LessonCommentsStore(super.useCase);
}

abstract class _LessonCommentsStore with Store {
  final GetLessonCommentsUseCase _useCase;

  _LessonCommentsStore(this._useCase);

  @observable
  List<LessonCommentModel>? comments;

  @observable
  List<LessonCommentModel> socketComments = [];

  @action
  addComment(LessonCommentModel comment) {
    socketComments.insert(0, comment);
  }

  @observable
  String? errorMessage;

  @observable
  ObservableFuture<Either<Failure, List<LessonCommentModel>>>? _commentsFuture;

  @computed
  BaseSate get state {
    if (_commentsFuture == null) {
      return BaseSate.init;
    }
    if (_commentsFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _commentsFuture!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @action
  Future<void> getLessonComments(String lessonId) async {
    errorMessage = null;

    _commentsFuture = ObservableFuture(
      _useCase(GetLessonCommentsUseCaseParams(lessonId)),
    );

    Either<Failure, List<LessonCommentModel>>? result = await _commentsFuture;

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
      (r) => comments = r,
    );
  }
}
