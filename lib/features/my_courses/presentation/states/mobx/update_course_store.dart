import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/my_courses/domain/usecases/my_course_use_cases/create_section_use_case.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../../bases/mobx/base_state.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../generated/translations/locale_keys.g.dart';
import '../../../../course_detail/domain/entities/course_detail_model.dart';
import '../../../../course_detail/domain/usecases/course_detail_use_case/get_course_detail_use_case.dart';
import '../../../../top/domain/entities/course_model.dart';
import '../../../../home/domain/entities/section_model.dart';
import '../../../domain/usecases/my_course_use_case.dart';
import '../../../domain/usecases/my_course_use_cases/delete_section_use_case.dart';
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
  int? sectionIndex;

  @observable
  String? errorMessage;

  @observable
  ObservableFuture<Either<Failure, CourseDetailModel>>? _courseFuture;

  @observable
  ObservableFuture<Either<Failure, CourseModel>>? _updateCourseFuture;

  @observable
  ObservableFuture<Either<Failure, SectionModel>>? _createSectionFuture;

  @observable
  ObservableFuture<Either<Failure, SectionModel>>? _updateSectionFuture;

  @observable
  ObservableFuture<Either<Failure, bool>>? _deleteSectionFuture;

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
    if (_updateCourseFuture == null) {
      return BaseSate.init;
    }
    if (_updateCourseFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _updateCourseFuture!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @computed
  BaseSate get createSectionState {
    if (_createSectionFuture == null) {
      return BaseSate.init;
    }
    if (_createSectionFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _createSectionFuture!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @computed
  BaseSate get updateSectionState {
    if (_updateSectionFuture == null) {
      return BaseSate.init;
    }
    if (_updateSectionFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _updateSectionFuture!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @computed
  BaseSate get deleteSectionState {
    if (_deleteSectionFuture == null) {
      return BaseSate.init;
    }
    if (_deleteSectionFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _deleteSectionFuture!.status == FutureStatus.pending
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
  Future<void> createSection(SectionModel section, String courseId) async {
    errorMessage = null;

    _createSectionFuture = ObservableFuture(
      _useCases.createSection(CreateSectionParams(section, courseId)),
    );

    Either<Failure, SectionModel>? result = await _createSectionFuture;

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
        this.section = r;
      },
    );
  }

  @action
  void reInitCreateSection() {
    _createSectionFuture = null;
  }

  @action
  void reInitDeleteSection() {
    _deleteSectionFuture = null;
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
      // (r) => section = r,
      (r) => log("update success with result $r"),
    );
  }

  @action
  Future<void> deleteSection(
    String sectionId,
    String courseId,
    int index,
  ) async {
    errorMessage = null;

    _deleteSectionFuture = ObservableFuture(
      _useCases.deleteSection(
        DeleteSectionParams(courseId, sectionId),
      ),
    );

    Either<Failure, bool>? result = await _deleteSectionFuture;

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
      // (r) => section = r,
      (r) {
        sectionIndex = index;
      },
    );
  }
}
