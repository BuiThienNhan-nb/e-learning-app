import 'package:e_learning_app/bases/presentation/atoms/loading_dialog.dart';
import 'package:e_learning_app/features/course_detail/presentation/pages/course_detail_page.dart';
import 'package:e_learning_app/features/course_detail/presentation/states/course_detail_store.dart';
import 'package:e_learning_app/features/course_detail/presentation/states/course_rate_store.dart';
import 'package:e_learning_app/features/list/presentation/list_screen_presenter.dart';
import 'package:e_learning_app/features/list/presentation/widgets/list_courses_item.dart';
import 'package:e_learning_app/features/list/presentation/widgets/w_app_bar.dart';
import 'package:e_learning_app/features/presenters/top/top_state.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class ListScreenView extends StatefulWidget {
  const ListScreenView({
    super.key,
    required this.coursesType,
    this.category,
  });

  final CoursesType coursesType;
  final String? category;

  @override
  State<ListScreenView> createState() => _ListScreenViewState();
}

class _ListScreenViewState extends State<ListScreenView>
    with WidgetsBindingObserver {
  late ListScreenPresenter presenter;

  @override
  void initState() {
    presenter = context.read<ListScreenPresenter>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      presenter.fetchCoursesByType(
        widget.coursesType,
        widget.category,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListScreen(
      coursesType: widget.coursesType,
      presenter: presenter,
      category: widget.category,
    );
  }
}

class ListScreen extends StatelessWidget {
  const ListScreen({
    super.key,
    required this.coursesType,
    required this.presenter,
    required this.category,
  });

  final CoursesType coursesType;
  final String? category;
  final ListScreenPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WAppBar(
        title: category != null ? '$category Courses' : coursesType.toString(),
      ),
      body: RefreshIndicator(
        onRefresh: () async =>
            presenter.fetchCoursesByType(coursesType, category),
        child: Selector<ListScreenPresenter, bool>(
          selector: (_, presenter) => presenter.isLoading,
          builder: (_, isLoading, __) {
            if (isLoading) {
              return const LoadingWidget();
            }
            if (presenter.errorMessage.isNotEmpty) {
              return Center(
                child: Text(presenter.errorMessage),
              );
            }
            return ListView.builder(
              itemCount: presenter.courses.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (_, index) => ListCoursesItem(
                course: presenter.courses[index],
                onCourseTap: (course) => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => MultiProvider(
                      providers: [
                        Provider<CourseDetailStore>(
                          create: (_) => GetIt.I(),
                          lazy: true,
                        ),
                        Provider<CourseRateStore>(
                          create: (_) => GetIt.I(),
                          lazy: true,
                        ),
                      ],
                      child: CourseDetailPage(
                        courseId: course.id,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
