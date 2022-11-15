import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../bases/presentation/atoms/network_image.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/styles.dart';
import '../../../home/domain/entities/course_model.dart';

class MyCourseCard extends StatelessWidget {
  const MyCourseCard({
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

/*
          Stack(
            fit: StackFit.loose,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppDimens.mediumHeightDimens),
                  Container(
                    padding: EdgeInsets.all(AppDimens.mediumHeightDimens),
                    decoration: BoxDecoration(
                      color: AppColors.subThemeColor,
                      borderRadius:
                          BorderRadius.circular(AppDimens.mediumRadius),
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
                  SizedBox(
                    width: AppDimens.appDesignSize.width -
                        AppDimens.mediumWidthDimens * 22,
                    child: Text(
                      course.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.headline6TextStyle.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  // SizedBox(height: AppDimens.smallHeightDimens),
                  SizedBox(
                    width: AppDimens.mediumWidthDimens * 18,
                    height: AppDimens.extraLargeHeightDimens,
                    child: (course.sale != null && course.sale != 0)
                        ? RichText(
                            text: TextSpan(
                              style: AppStyles.headline6TextStyle.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w900,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      "${(course.price * (1 - course.sale!)).toStringAsFixed(2)}\$\t\t",
                                ),
                                TextSpan(
                                  text: "${course.price.toStringAsFixed(2)}\$",
                                  style: AppStyles.subtitle1TextStyle.copyWith(
                                    color: AppColors.neutral.shade500,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: AppColors.neutral.shade700,
                                    decorationThickness: 2,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Text(
                            "${course.price.toStringAsFixed(2)}\$",
                            style: AppStyles.headline6TextStyle.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                  ),
                ],
              ),
              Positioned(
                right: AppDimens.smallWidthDimens,
                bottom: AppDimens.mediumHeightDimens,
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        "\t${course.rates.toStringAsFixed(2)}",
                        style: AppStyles.subtitle2TextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        */
        ],
      ),
    );
  }
}
