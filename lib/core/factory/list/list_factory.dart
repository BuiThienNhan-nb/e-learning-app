import 'package:e_learning_app/features/get_all_courses/domain/usecases/get_all_courses_use_case.dart';
import 'package:e_learning_app/features/home/domain/usecases/lesson_use_cases/get_rcm_courses_use_case.dart';
import 'package:e_learning_app/features/list/data/remote_fetch_courses_by_category.dart';
import 'package:e_learning_app/features/list/presentation/list_screen.dart';
import 'package:e_learning_app/features/list/presentation/list_screen_presenter.dart';
import 'package:e_learning_app/features/presenters/list/list_screen_state.dart';
import 'package:e_learning_app/features/presenters/list/provider_list_screen_presenter.dart';
import 'package:e_learning_app/features/presenters/top/top_state.dart';
import 'package:e_learning_app/features/top/domain/repositories/fetch_latest_courses.dart';
import 'package:e_learning_app/features/top/domain/repositories/fetch_top_rate_courses.dart';
import 'package:get_it/get_it.dart';

ListScreenView makeListScreenView(CoursesType coursesType,
        [String? category]) =>
    ListScreenView(
      coursesType: coursesType,
      category: category,
    );

ListScreenPresenter makeListScreenPresenter() => ProviderListScreenPresenter(
      ListScreenState.initial(),
      GetIt.I<GetAllCoursesUseCase>(),
      RemoteFetchCoursesByCategory(),
      GetIt.I<GetRecommendedCoursesUseCase>(),
      GetIt.I<FetchTopRateCourses>(),
      GetIt.I<FetchLatestCourses>(),
    );
