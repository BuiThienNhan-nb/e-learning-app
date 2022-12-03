import 'package:e_learning_app/bases/presentation/atoms/default_sliver_appbar.dart';
import 'package:e_learning_app/features/home/domain/entities/course_model.dart';
import 'package:e_learning_app/features/enrolled_courses/presentation/widgets/enrolled_course_card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../utils/mock/mock_courses.dart';

class EnrolledCoursesPage extends StatelessWidget {
  const EnrolledCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CourseModel> courses = GetIt.I<MockCourses>().recommendedLessons;
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const DefaultSliverAppBar(title: "Enrolled Courses"),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ListView.builder(
                  itemCount: courses.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) =>
                      EnrolledCourseCard(course: courses[index]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
