import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../core/error/failures.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../../auth/sign_in/domain/entities/user_model.dart';
import '../../domain/entities/course_detail_model.dart';
import '../../domain/usecases/course_detail_use_case/get_course_detail_use_case.dart';
import '../../domain/usecases/course_detail_use_case/join_course_use_case.dart';
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
  UserModel? user;

  @observable
  ObservableFuture<Either<Failure, CourseDetailModel>>? _courseFuture;

  @observable
  ObservableFuture<Either<Failure, UserModel>>? _joinFuture;

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
  BaseSate get joinState {
    if (_joinFuture == null) {
      return BaseSate.init;
    }
    if (_joinFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _joinFuture!.status == FutureStatus.pending
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
  Future<void> joinCourse(String userId, String courseId) async {
    errorMessage = null;

    _joinFuture = ObservableFuture(
      _useCases.joinCourse(
        JoinCourseParams(userId, courseId),
      ),
    );

    Either<Failure, UserModel>? result = await _joinFuture;

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
        user = r;
        courseDetail!.isEnrolled = true;
      },
    );
  }
}
