import 'package:e_learning_app/bases/mobx/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../bases/presentation/atoms/loading_dialog.dart';
import '../../../../bases/presentation/atoms/recommendation_course_card.dart';
import '../../../../configs/styles.dart';
import '../../../home/domain/entities/course_model.dart';
import '../states/teacher_detail_store.dart';

class TeacherCoursesPage extends StatelessWidget {
  const TeacherCoursesPage({
    super.key,
    required this.courses,
    required this.store,
    required this.teacherId,
  });

  final List<CourseModel> courses;
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
              itemCount: courses.length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) =>
                  RecommendationCourseCard(course: courses[index]),
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
