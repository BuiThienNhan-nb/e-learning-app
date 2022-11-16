import 'dart:ui';

import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/configs/dimens.dart';
import 'package:e_learning_app/features/course_detail/domain/entities/course_detail_model.dart';
import 'package:e_learning_app/features/course_detail/presentation/widgets/section_build.dart';
import 'package:flutter/material.dart';

class CourseLessonPage extends StatelessWidget {
  const CourseLessonPage({
    super.key,
    required this.course,
  });

  final CourseDetailModel course;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: course.section
                .map(
                  (section) => CourseSectionWidget(section: section),
                )
                .toList(),
          ),
        ),
        course.isPaid
            ? const SizedBox.shrink()
            : BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Image.asset(
                      "assets/icons/lock_fill_icon.png",
                      color: AppColors.primaryColor,
                      height: AppDimens.extraLargeHeightDimens * 8,
                      width: AppDimens.extraLargeWidthDimens * 8,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
