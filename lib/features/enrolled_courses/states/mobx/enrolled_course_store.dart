import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/enrolled_courses/domain/usecases/enrolled_course_use_case.dart';
import 'package:e_learning_app/features/enrolled_courses/domain/usecases/enrolled_course_use_case/get_course_by_list_id.dart';
import 'package:e_learning_app/features/home/domain/entities/course_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../core/error/failures.dart';
import '../../../../generated/translations/locale_keys.g.dart';

part 'enrolled_course_store.g.dart';

@injectable
class EnrolledCourseStore extends _EnrolledCourseStore
    with _$EnrolledCourseStore {
  EnrolledCourseStore(super.useCase);
}

abstract class _EnrolledCourseStore with Store {
  final EnrolledCourseUseCase _useCase;

  _EnrolledCourseStore(this._useCase);

  @observable
  List<CourseModel>? courses;

  @observable
  String? errorMessage;

  @observable
  ObservableFuture<Either<Failure, List<CourseModel>>>? _coursesFuture;

  @computed
  BaseSate get state {
    if (_coursesFuture == null) {
      return BaseSate.init;
    }
    if (_coursesFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _coursesFuture!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @action
  Future<void> getCourseByListId(List<String> listId) async {
    errorMessage = null;

    _coursesFuture = ObservableFuture(
      _useCase.getCourseByListId(
        GetCourseByListIdParams(listId),
      ),
    );

    Either<Failure, List<CourseModel>>? resetOrFailure = await _coursesFuture;

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
      (r) => courses = r,
    );
  }
}
