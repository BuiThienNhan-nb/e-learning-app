import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../../bases/mobx/base_state.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../generated/translations/locale_keys.g.dart';
import '../../../../course_detail/domain/entities/course_detail_model.dart';
import '../../../../course_detail/domain/usecases/course_detail_use_case/get_course_detail_use_case.dart';
import '../../../../home/domain/entities/course_model.dart';
import '../../../../home/domain/entities/section_model.dart';
import '../../../domain/usecases/my_course_use_case.dart';
import '../../../domain/usecases/my_course_use_cases/update_course_use_case.dart';
import '../../../domain/usecases/my_course_use_cases/update_section_use_case.dart';

part 'update_course_store.g.dart';

@injectable
class UpdateCourseStore extends _UpdateCourseStore with _$UpdateCourseStore {
  UpdateCourseStore(super.useCases);
}

abstract class _UpdateCourseStore with Store {
  final MyCourseUseCase _useCases;

  _UpdateCourseStore(this._useCases);

  @observable
  CourseDetailModel? courseDetail;
  @observable
  CourseModel? course;
  @observable
  SectionModel? section;

  @observable
  String? errorMessage;

  @observable
  ObservableFuture<Either<Failure, CourseDetailModel>>? _courseFuture;

  @observable
  ObservableFuture<Either<Failure, CourseModel>>? _updateCourseFuture;

  @observable
  ObservableFuture<Either<Failure, SectionModel>>? _updateSectionFuture;

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

  @computed
  BaseSate get updateState {
    if (_updateCourseFuture == null || _updateSectionFuture == null) {
      return BaseSate.init;
    }
    if (_updateCourseFuture!.status == FutureStatus.rejected ||
        _updateSectionFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _updateCourseFuture!.status == FutureStatus.pending ||
            _updateSectionFuture!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  // @computed
  // BaseSate get updateSectionState {
  //   if (_updateSectionFuture == null) {
  //     return BaseSate.init;
  //   }
  //   if (_updateSectionFuture!.status == FutureStatus.rejected) {
  //     return BaseSate.error;
  //   }
  //   return _updateSectionFuture!.status == FutureStatus.pending
  //       ? BaseSate.loading
  //       : BaseSate.loaded;
  // }

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

  @action
  Future<void> updateCourseInformation(
    CourseModel course,
    bool isUpdateImage,
  ) async {
    errorMessage = null;

    _updateCourseFuture = ObservableFuture(
      _useCases.updateCourse(
        UpdateCourseParams(course, isUpdateImage),
      ),
    );

    Either<Failure, CourseModel>? result = await _updateCourseFuture;

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
      (r) => course = r,
    );
  }

  @action
  Future<void> updateSection(SectionModel section, String courseId) async {
    errorMessage = null;

    _updateSectionFuture = ObservableFuture(
      _useCases.updateSection(UpdateSectionParams(section, courseId)),
    );

    Either<Failure, SectionModel>? result = await _updateSectionFuture;

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
      (r) => section = r,
    );
  }
}
