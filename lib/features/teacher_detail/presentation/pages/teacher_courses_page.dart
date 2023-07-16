import 'package:e_learning_app/features/course_detail/presentation/pages/course_detail_page.dart';
import 'package:e_learning_app/features/course_detail/presentation/states/course_detail_store.dart';
import 'package:e_learning_app/features/course_detail/presentation/states/course_rate_store.dart';
import 'package:e_learning_app/features/list/presentation/widgets/list_courses_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../bases/presentation/atoms/loading_dialog.dart';
import '../../../../configs/styles.dart';
import '../states/teacher_detail_store.dart';

class TeacherCoursesPage extends StatelessWidget {
  const TeacherCoursesPage({
    super.key,
    // required this.courses,
    required this.store,
    required this.teacherId,
  });

  // final List<CourseModel> courses;
  final TeacherDetailStore store;
  final String teacherId;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (store.getCourseState == BaseSate.init) {
        store.getTeacherCourses(teacherId);
      }

      return store.getCourseState == BaseSate.loaded
          ? ListView.builder(
              itemCount: store.courses!.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (_, index) => ListCoursesItem(
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
              child: store.getCourseState == BaseSate.loading
                  ? const LoadingWidget()
                  : Text(
                      store.errorMessage ?? "Unexpected error!!",
                      style: AppStyles.subtitle1TextStyle,
                    ),
            );
    });
  }
}
