import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../../bases/mobx/base_state.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../../../../generated/translations/locale_keys.g.dart';
import '../../../../top/domain/entities/course_model.dart';
import '../../../domain/usecases/my_course_use_case.dart';

part 'my_course_store.g.dart';

@injectable
class MyCourseStore extends _MyCourseStore with _$MyCourseStore {
  MyCourseStore(super.useCase);
}

abstract class _MyCourseStore with Store {
  final MyCourseUseCase _useCase;

  _MyCourseStore(this._useCase);

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
  Future<void> getMyCourses() async {
    errorMessage = null;

    _coursesFuture = ObservableFuture(
      _useCase.getMyCourse(
        NoParams(),
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
