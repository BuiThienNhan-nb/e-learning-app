import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../core/error/failures.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../../auth/sign_in/domain/entities/teacher_model.dart';
import '../../../home/domain/entities/course_model.dart';
import '../../domain/usecases/teacher_detail_use_case.dart';
import '../../domain/usecases/teacher_detail_use_case/get_teacher_by_id.dart';

part 'teacher_detail_store.g.dart';

@injectable
class TeacherDetailStore extends _TeacherDetailStore with _$TeacherDetailStore {
  TeacherDetailStore(super.useCase);
}

abstract class _TeacherDetailStore with Store {
  final TeacherDetailUseCase _useCase;

  _TeacherDetailStore(this._useCase);

  @observable
  TeacherModel? teacher;

  @observable
  List<CourseModel>? courses;

  @observable
  String? errorMessage;

  @observable
  ObservableFuture<Either<Failure, TeacherModel>>? _getTeacherFuture;

  @observable
  ObservableFuture<Either<Failure, List<CourseModel>>>? _getCoursesFuture;

  @computed
  BaseSate get getTeacherState {
    if (_getTeacherFuture == null) {
      return BaseSate.init;
    }
    if (_getTeacherFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _getTeacherFuture!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @computed
  BaseSate get getCourseState {
    if (_getCoursesFuture == null) {
      return BaseSate.init;
    }
    if (_getCoursesFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _getCoursesFuture!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @action
  Future<void> getTeacherById(String teacherId) async {
    errorMessage = null;

    _getTeacherFuture = ObservableFuture(
      _useCase.getTeacherById(
        GetTeacherByIdParams(teacherId),
      ),
    );

    Either<Failure, TeacherModel>? resetOrFailure = await _getTeacherFuture;

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
      (r) => teacher = r,
    );
  }

  @action
  Future<void> getTeacherCourses(String teacherId) async {
    errorMessage = null;

    _getCoursesFuture = ObservableFuture(
      _useCase.getTeacherCourse(
        GetTeacherByIdParams(teacherId),
      ),
    );

    Either<Failure, List<CourseModel>>? resetOrFailure =
        await _getCoursesFuture;

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
