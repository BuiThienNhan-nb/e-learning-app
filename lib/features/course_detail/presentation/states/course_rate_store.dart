import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../core/app/provider.dart';
import '../../../../core/error/failures.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../domain/usecases/course_rate_use_cases.dart';
import '../../domain/usecases/course_rate_use_cases/get_course_rate.dart';

part 'course_rate_store.g.dart';

@injectable
class CourseRateStore extends _CourseRateStore with _$CourseRateStore {
  CourseRateStore(super.useCases);
}

abstract class _CourseRateStore with Store {
  final CourseRateUseCases _useCases;
  final String _userId = GetIt.I<AppProvider>().user.id;

  _CourseRateStore(this._useCases);

  @observable
  int? currentRate;

  @observable
  String? errorMessage;

  @observable
  double courseRate = 0.0;
  @observable
  int courseRateCount = 0;

  @observable
  ObservableFuture<Either<Failure, int?>>? _currentRateFuture;

  @computed
  BaseSate get state {
    if (_currentRateFuture == null) {
      return BaseSate.init;
    }
    if (_currentRateFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _currentRateFuture!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @action
  void setCourseRate(double value) {
    courseRate = value;
  }

  @action
  void setCourseRateCount(int value) {
    courseRateCount = value;
  }

  @action
  Future<void> getCourseRate(String courseId) async {
    errorMessage = null;

    _currentRateFuture = ObservableFuture(
      _useCases.getCourseRateUseCase(
        CourseRateParams(_userId, courseId, 0),
      ),
    );

    Either<Failure, int?>? result = await _currentRateFuture;

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
      (r) => currentRate = r,
    );
  }

  @action
  void updateCourseRate() {
    courseRate =
        (courseRate * courseRateCount + currentRate!) / (courseRateCount++);
    log("New course rate: $courseRate with $courseRateCount rating");
  }

  @action
  Future<void> rateCourse(String courseId, int score) async {
    errorMessage = null;

    _currentRateFuture = ObservableFuture(
      _useCases.rateCourseUseCase(
        CourseRateParams(_userId, courseId, score),
      ),
    );

    Either<Failure, int?>? result = await _currentRateFuture;

    if (result == null) {
      errorMessage = LocaleKeys.serverUnexpectedError.tr();
      return;
    }

    if (result.isRight()) {
      // Update current course rate
      updateCourseRate();
    }

    return result.fold(
      (l) {
        (l is UserFailure || l is ServerFailure)
            ? errorMessage = l.message
            : errorMessage = LocaleKeys.serverUnexpectedError.tr();
      },
      (r) {
        currentRate = r!;
      },
    );
  }
}
