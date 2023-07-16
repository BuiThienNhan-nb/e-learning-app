import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/configs/formats.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';
import 'package:flutter/material.dart';

class CourseDetailInteraction extends StatelessWidget {
  CourseDetailInteraction({
    super.key,
    required this.course,
  });

  final CourseModel course;
  final TextStyle textStyle = AppStyles.subtitle2TextStyle.copyWith(
    fontWeight: FontWeight.w900,
  );

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            "assets/icons/people_icon.png",
            color: AppColors.primaryColor,
          ),
          Text(
            "${AppFormats.instance.oCcy.format(9281)} Students",
            style: textStyle,
          ),
          Image.asset(
            "assets/icons/clock_icon.png",
            color: AppColors.primaryColor,
          ),
          Text(
            "${course.totalCourseHours().toStringAsFixed(1)} Hours",
            style: textStyle,
          ),
          Image.asset(
            "assets/icons/certificate_icon.png",
            color: course.haveCertificate
                ? AppColors.primaryColor
                : AppColors.neutral.shade400,
          ),
          Text(
            "Certificate",
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
