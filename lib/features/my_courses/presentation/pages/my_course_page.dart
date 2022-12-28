import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../configs/colors.dart';
import '../../../../utils/mock/mock_courses.dart';
import '../../../settings/presentation/widgets/setting_app_bar.dart';
import '../widgets/my_course_card.dart';

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
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => GoRouter.of(context).pushNamed(
            "update_course",
            params: {
              'courseId': courses[index].id,
            },
            // extra: [
            //   context.read<UpdateCourseStore>(),
            //   context.read<UpdateCourseProvider>(),
            // ],
          ),
          child: MyCourseCard(course: courses[index]),
        ),
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
