import 'package:e_learning_app/features/get_all_courses/domain/usecases/get_all_courses_use_case.dart';
import 'package:e_learning_app/features/list/presentation/list_screen.dart';
import 'package:e_learning_app/features/list/presentation/list_screen_presenter.dart';
import 'package:e_learning_app/features/presenters/list/list_screen_state.dart';
import 'package:e_learning_app/features/presenters/list/provider_list_screen_presenter.dart';
import 'package:e_learning_app/features/presenters/top/top_state.dart';
import 'package:get_it/get_it.dart';

ListScreenView makeListScreenView(CoursesType coursesType) =>
    ListScreenView(coursesType: coursesType);

ListScreenPresenter makeListScreenPresenter() => ProviderListScreenPresenter(
      ListScreenState.initial(),
      GetIt.I<GetAllCoursesUseCase>(),
    );
