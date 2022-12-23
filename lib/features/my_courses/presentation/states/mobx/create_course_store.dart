import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../../bases/mobx/base_state.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../generated/translations/locale_keys.g.dart';
import '../../../../home/domain/entities/course_model.dart';
import '../../../domain/usecases/my_course_use_case.dart';
import '../../../domain/usecases/my_course_use_cases/create_course_use_case.dart';

part 'create_course_store.g.dart';

@injectable
class CreateCourseStore extends _CreateCourseStore with _$CreateCourseStore {
  CreateCourseStore(super.useCase);
}

abstract class _CreateCourseStore with Store {
  final MyCourseUseCase _useCase;

  _CreateCourseStore(this._useCase);

  @observable
  CourseModel? course;

  @observable
  String? errorMessage;

  @observable
  ObservableFuture<Either<Failure, CourseModel>>? _courseFuture;

  @observable
  PageController controller = PageController(initialPage: 0);

  @observable
  int stepIndex = 0;

  @action
  void updateStepIndex(int value) {
    stepIndex = value;
  }

  @computed
  BaseSate get state {
    if (_courseFuture == null) {
      return BaseSate.init;
    }
    if (_courseFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _courseFuture!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @action
  Future<void> createCourse(CourseModel course) async {
    errorMessage = null;

    _courseFuture = ObservableFuture(
      _useCase.createCourse(
        CreateCourseParams(course),
      ),
    );

    Either<Failure, CourseModel>? resetOrFailure = await _courseFuture;

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
      (r) => course = r,
    );
  }
}
