import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../domain/entities/course_detail_model.dart';
import '../widgets/section_build.dart';

class CourseLessonPage extends StatelessWidget {
  const CourseLessonPage({
    super.key,
    required this.course,
  });

  final CourseDetailModel course;

  @override
  Widget build(BuildContext context) {
    int index = 0;

    return Stack(
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: course.section
                .map(
                  (section) => CourseSectionWidget(
                    section: section,
                    index: index++,
                  ),
                )
                .toList(),
          ),
        ),
        course.isEnrolled
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
