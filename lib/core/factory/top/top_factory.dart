import 'package:e_learning_app/features/home/domain/usecases/lesson_use_cases/get_rcm_courses_use_case.dart';
import 'package:e_learning_app/features/presenters/top/provider_top_presenter.dart';
import 'package:e_learning_app/features/presenters/top/top_state.dart';
import 'package:e_learning_app/features/top/presentation/top_presenter.dart';
import 'package:get_it/get_it.dart';

TopPresenter makeTopPresenter() {
  return ProviderTopPresenter(
    TopState.initial(),
    GetIt.I<GetRecommendedCoursesUseCase>(),
  );
}
