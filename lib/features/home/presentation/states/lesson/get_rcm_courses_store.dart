import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/usecases/base_use_case.dart';
import 'package:e_learning_app/features/home/domain/usecases/lesson_use_cases/get_rcm_courses_use_case.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../../bases/mobx/base_state.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../generated/translations/locale_keys.g.dart';

part 'get_rcm_courses_store.g.dart';

@injectable
class GetRecommendedCoursesStore extends _GetRecommendedCoursesStore
    with _$GetRecommendedCoursesStore {
  GetRecommendedCoursesStore(super.useCase);
}

abstract class _GetRecommendedCoursesStore with Store {
  final GetRecommendedCoursesUseCase _useCase;

  _GetRecommendedCoursesStore(this._useCase);

  @observable
  List<CourseModel>? recommendedLessons;

  @observable
  String? errorMessage;

  @observable
  ObservableFuture<Either<Failure, List<CourseModel>>>?
      _recommendedLessonsFuture;

  @computed
  BaseSate get state {
    if (_recommendedLessonsFuture == null) {
      return BaseSate.init;
    }
    if (_recommendedLessonsFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _recommendedLessonsFuture!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @action
  Future<void> getRecommendedLessons() async {
    errorMessage = null;

    _recommendedLessonsFuture = ObservableFuture(
      _useCase(NoParams()),
    );

    Either<Failure, List<CourseModel>>? result =
        await _recommendedLessonsFuture;

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
      (r) => recommendedLessons = r,
    );
  }
}
