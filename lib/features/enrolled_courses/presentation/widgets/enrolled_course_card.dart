import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../bases/presentation/atoms/network_image.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/styles.dart';
import '../../../home/domain/entities/course_model.dart';

class EnrolledCourseCard extends StatelessWidget {
  const EnrolledCourseCard({
    super.key,
    required this.course,
  });

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    final progress = Random().nextDouble();
    return Container(
      height: AppDimens.extraLargeHeightDimens * 7,
      width: double.infinity,
      margin: EdgeInsets.all(AppDimens.mediumWidthDimens),
      padding: EdgeInsets.only(
        left: AppDimens.mediumWidthDimens,
        top: AppDimens.smallHeightDimens,
        bottom: AppDimens.smallHeightDimens,
        right: 0,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.neutral.shade300),
        borderRadius: BorderRadius.circular(AppDimens.largeRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral.shade200,
            blurRadius: AppDimens.mediumHeightDimens,
            // offset: const Offset(1, 1),
            blurStyle: BlurStyle.normal,
            spreadRadius: 0.2,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: AppDimens.smallWidthDimens),
          DefaultNetworkImage(
            imageUrl: course.image.url,
            blurHash: course.image.blurHash,
            height: (AppDimens.extraLargeHeightDimens * 5),
            width: AppDimens.mediumWidthDimens * 16,
            shape: BoxShape.rectangle,
            borderRadius: AppDimens.mediumRadius,
          ),
          SizedBox(width: AppDimens.mediumWidthDimens),
          SizedBox(
            width: AppDimens.extraLargeWidthDimens * 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(AppDimens.mediumHeightDimens),
                  decoration: BoxDecoration(
                    color: AppColors.subThemeColor,
                    borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
                  ),
                  child: Text(
                    course.category,
                    style: AppStyles.subtitle2TextStyle.copyWith(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: AppDimens.mediumHeightDimens),
                Text(
                  course.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.subtitle1TextStyle.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          CircularPercentIndicator(
            radius: AppDimens.extraLargeWidthDimens * 1.2,
            percent: progress,
            lineWidth: 8,
            animation: true,
            animationDuration: 1200,
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: progress >= 0.6
                ? AppColors.pigmentGreenColor
                : progress >= 0.4
                    ? Colors.yellow
                    : AppColors.fireEngineRedColor,
            center: Text(
              "${(progress * 100).toStringAsFixed(1)}%",
              style: AppStyles.subtitle2TextStyle.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
