import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../../bases/presentation/atoms/recommendation_course_card.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/styles.dart';
import '../../../../utils/mock/mock_courses.dart';
import '../../../../utils/mock/mock_teachers.dart';
import '../../../auth/sign_in/domain/entities/teacher_model.dart';
import '../../../home/domain/entities/course_model.dart';
import '../widgets/teacher_interact_button.dart';
import '../widgets/teacher_interaction.dart';

class TeacherDetailPage extends StatelessWidget {
  const TeacherDetailPage({
    super.key,
    required this.teacherId,
  });

  final String teacherId;

  @override
  Widget build(BuildContext context) {
    final TeacherModel teacher = GetIt.I<MockTeachers>().topTeachers.firstWhere(
          (element) => element.id == teacherId,
        );
    final List<CourseModel> courses = GetIt.I<MockCourses>().recommendedLessons;

    final List<Widget> tabs = [
      Tab(
        text: "${teacher.name} courses",
      ),
      const Tab(
        text: "Reviews",
      ),
      const Tab(
        text: "Related Mentors",
      ),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: AppColors.whiteColor,
          iconTheme: IconThemeData(
            color: AppColors.blackColor,
            size: AppDimens.extraLargeWidthDimens,
          ),
          actionsIconTheme: const IconThemeData(
            color: AppColors.blackColor,
          ),
          title: Text(
            teacher.name,
            style: AppStyles.headline5TextStyle.copyWith(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: AppDimens.extraLargeHeightDimens),
            TeacherInteraction(teacher: teacher),
            SizedBox(height: AppDimens.mediumHeightDimens),
            Text(
              "\t\tThis is Teacher's bio!",
              style: AppStyles.subtitle1TextStyle,
            ),
            SizedBox(height: AppDimens.largeHeightDimens),
            TeacherInteractButtonRow(teacherId: teacherId),
            SizedBox(height: AppDimens.mediumHeightDimens),
            Divider(
              color: AppColors.primaryColor,
              indent: AppDimens.largeWidthDimens,
              endIndent: AppDimens.largeWidthDimens,
            ),
            TabBar(
              tabs: tabs,
              labelColor: AppColors.primaryColor,
              indicator: MaterialIndicator(
                tabPosition: TabPosition.bottom,
                color: AppColors.primaryColor,
                strokeWidth: 1,
                horizontalPadding: AppDimens.extraLargeWidthDimens,
                // distanceFromCenter: 16,
                // radius: 3,
                paintingStyle: PaintingStyle.fill,
              ),
            ),
            // Divider(
            //   color: AppColors.primaryColor,
            //   indent: AppDimens.largeWidthDimens,
            //   endIndent: AppDimens.largeWidthDimens,
            // ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: courses.length,
                    // physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) =>
                        RecommendationCourseCard(course: courses[index]),
                  ),
                  const Text("Page 2"),
                  const Text("Page 3"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
