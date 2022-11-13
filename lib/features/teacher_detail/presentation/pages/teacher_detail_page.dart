import 'package:e_learning_app/bases/presentation/atoms/recommendation_course_card.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:e_learning_app/features/auth/sign_in/domain/entities/teacher_model.dart';
import 'package:e_learning_app/features/home/domain/entities/course_model.dart';
import 'package:e_learning_app/features/teacher_detail/presentation/widgets/teacher_interact_button.dart';
import 'package:e_learning_app/features/teacher_detail/presentation/widgets/teacher_interaction.dart';
import 'package:get_it/get_it.dart';

import '../../../../configs/colors.dart';
import 'package:flutter/material.dart';

import '../../../../configs/dimens.dart';
import '../../../../utils/mock/mock_courses.dart';
import '../../../../utils/mock/mock_teachers.dart';

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

    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
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
            SizedBox(height: AppDimens.extraLargeHeightDimens),
            ListView.builder(
              itemCount: courses.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) =>
                  RecommendationCourseCard(course: courses[index]),
            ),
          ],
        ),
      ),
    );
  }
}
