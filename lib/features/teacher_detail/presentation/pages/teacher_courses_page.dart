import 'package:flutter/material.dart';

import '../../../../bases/presentation/atoms/recommendation_course_card.dart';
import '../../../home/domain/entities/course_model.dart';

class TeacherCoursesPage extends StatelessWidget {
  const TeacherCoursesPage({
    super.key,
    required this.courses,
  });

  final List<CourseModel> courses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) =>
          RecommendationCourseCard(course: courses[index]),
    );
  }
}
