import 'dart:math';

import 'package:e_learning_app/bases/presentation/atoms/bookmark_icon.dart';
import 'package:e_learning_app/bases/presentation/atoms/network_image.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:e_learning_app/features/home/domain/entities/course_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../configs/colors.dart';
import '../../../configs/dimens.dart';

class RecommendationCourseCard extends StatelessWidget {
  const RecommendationCourseCard({
    super.key,
    required this.course,
    this.height,
  });

  final double? height;
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).pushNamed(
        "course_detail",
        params: {
          'courseId': course.id,
        },
      ),
      child: Container(
        // height: height ?? AppDimens.extraLargeHeightDimens * 8,
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
          mainAxisSize: MainAxisSize.max,
          children: [
            DefaultNetworkImage(
              imageUrl: course.image.url,
              blurHash: course.image.blurHash,
              height: height ?? (AppDimens.extraLargeHeightDimens * 7),
              width: AppDimens.mediumWidthDimens * 20,
              shape: BoxShape.rectangle,
              borderRadius: AppDimens.mediumRadius,
            ),
            SizedBox(width: AppDimens.mediumWidthDimens),
            Stack(
              fit: StackFit.loose,
              children: [
                Positioned(
                  right: 0,
                  top: AppDimens.mediumHeightDimens,
                  child: BookmarkIcon(isBookmark: Random().nextBool()),
                ),
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
                                    text:
                                        "${course.price.toStringAsFixed(2)}\$",
                                    style:
                                        AppStyles.subtitle1TextStyle.copyWith(
                                      color: AppColors.neutral.shade500,
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor:
                                          AppColors.neutral.shade700,
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
          ],
        ),
      ),
    );
  }
}