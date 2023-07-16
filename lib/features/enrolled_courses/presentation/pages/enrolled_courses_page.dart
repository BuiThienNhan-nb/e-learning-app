import 'package:e_learning_app/features/course_detail/presentation/pages/course_detail_page.dart';
import 'package:e_learning_app/features/course_detail/presentation/states/course_detail_store.dart';
import 'package:e_learning_app/features/course_detail/presentation/states/course_rate_store.dart';
import 'package:e_learning_app/features/list/presentation/widgets/list_courses_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../bases/presentation/atoms/default_app_bar.dart';
import '../../../../bases/presentation/atoms/loading_dialog.dart';
import '../../../../configs/styles.dart';
import '../../../../core/app/provider.dart';
import '../../states/mobx/enrolled_course_store.dart';

class EnrolledCoursesPage extends StatelessWidget {
  const EnrolledCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<CourseModel> courses = GetIt.I<MockCourses>().recommendedLessons;
    final store = GetIt.I<EnrolledCourseStore>();

    return Scaffold(
      appBar: const DefaultAppBar(title: "Enrolled Courses"),
      body: RefreshIndicator(
        onRefresh: () async =>
            store.getCourseByListId(GetIt.I<AppProvider>().user.courseJoined),
        child: Observer(
          builder: (_) {
            if (store.state == BaseSate.init) {
              store.getCourseByListId(GetIt.I<AppProvider>().user.courseJoined);
            }

            return store.state == BaseSate.loaded
                ? ListView.builder(
                    itemCount: store.courses!.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, index) => ListCoursesItem(
                      isEnrolled: true,
                      course: store.courses![index],
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
                  )
                : Center(
                    child: store.state == BaseSate.loading
                        ? const LoadingWidget()
                        : Text(
                            store.errorMessage ?? "Unexpected error!",
                            style: AppStyles.subtitle1TextStyle,
                          ),
                  );
          },
        ),
      ),
    );
  }
}
