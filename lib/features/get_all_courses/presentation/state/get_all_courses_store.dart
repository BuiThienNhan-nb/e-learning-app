import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/base_use_case.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../../top/domain/entities/course_model.dart';
import '../../domain/usecases/get_all_courses_use_case.dart';

part 'get_all_courses_store.g.dart';

@injectable
class GetAllCoursesStore extends _GetAllCoursesStore with _$GetAllCoursesStore {
  GetAllCoursesStore(super.useCase);
}

abstract class _GetAllCoursesStore with Store {
  final GetAllCoursesUseCase _useCase;

  _GetAllCoursesStore(this._useCase);

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
  Future<void> getAllCourses() async {
    errorMessage = null;

    _coursesFuture = ObservableFuture(
      _useCase.getAllCourses(NoParams()),
    );

    Either<Failure, List<CourseModel>>? result = await _coursesFuture;

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
      (r) => courses = r,
    );
  }
}
