import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/features/my_courses/presentation/widgets/my_course_card.dart';
import 'package:e_learning_app/features/settings/presentation/widgets/setting_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/mock/mock_courses.dart';

class MyCoursePage extends StatelessWidget {
  const MyCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = GetIt.I<MockCourses>().recommendedLessons;

    return Scaffold(
      appBar: const SettingAppBar(title: "My Courses"),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: ListView.builder(
        itemCount: courses.length,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => MyCourseCard(course: courses[index]),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Create new course",
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add),
        onPressed: () => GoRouter.of(context).pushNamed("create_course"),
      ),
    );
  }
}
