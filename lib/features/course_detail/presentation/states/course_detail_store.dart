import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../core/error/failures.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../domain/entities/course_detail_model.dart';
import '../../domain/usecases/course_detail_use_case/get_course_detail_use_case.dart';
import '../../domain/usecases/course_detail_use_cases.dart';

part 'course_detail_store.g.dart';

@injectable
class CourseDetailStore extends _CourseDetailStore with _$CourseDetailStore {
  CourseDetailStore(super.useCases);
}

abstract class _CourseDetailStore with Store {
  final CourseDetailUseCases _useCases;

  _CourseDetailStore(this._useCases);

  @observable
  CourseDetailModel? courseDetail;

  @observable
  String? errorMessage;

  @observable
  ObservableFuture<Either<Failure, CourseDetailModel>>? _courseFuture;

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
  Future<void> getCourseDetail(String courseId) async {
    errorMessage = null;

    _courseFuture = ObservableFuture(
      _useCases.getCourseDetailUseCase(
        GetCourseDetailParams(courseId),
      ),
    );

    Either<Failure, CourseDetailModel>? result = await _courseFuture;

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
      (r) => courseDetail = r,
    );
  }
}
