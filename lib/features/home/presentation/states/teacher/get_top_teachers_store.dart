import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/home/domain/usecases/teacher_use_cases/get_top_teacher_use_case.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../../bases/mobx/base_state.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/base_use_case.dart';
import '../../../../../generated/translations/locale_keys.g.dart';
import '../../../../auth/sign_in/domain/entities/teacher_model.dart';

part 'get_top_teachers_store.g.dart';

@injectable
class GetTopTeachersStore extends _GetTopTeachersStore
    with _$GetTopTeachersStore {
  GetTopTeachersStore(super.useCase);
}

abstract class _GetTopTeachersStore with Store {
  final GetTopTeachersUseCase _useCase;

  _GetTopTeachersStore(this._useCase);

  @observable
  List<TeacherModel>? topTeachers;

  @observable
  String? errorMessage;

  @observable
  ObservableFuture<Either<Failure, List<TeacherModel>>>? _topTeachersFuture;

  @computed
  BaseSate get state {
    if (_topTeachersFuture == null) {
      return BaseSate.init;
    }
    if (_topTeachersFuture!.status == FutureStatus.rejected) {
      return BaseSate.error;
    }
    return _topTeachersFuture!.status == FutureStatus.pending
        ? BaseSate.loading
        : BaseSate.loaded;
  }

  @action
  Future<void> getTopTeachers() async {
    errorMessage = null;

    _topTeachersFuture = ObservableFuture(
      _useCase(NoParams()),
    );

    Either<Failure, List<TeacherModel>>? result = await _topTeachersFuture;

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
      (r) => topTeachers = r,
    );
  }
}
