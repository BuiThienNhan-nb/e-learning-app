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
  RecommendationCourseCard({
    super.key,
    required this.course,
    this.height,
    this.isScalePrice = false,
  });

  final double? height;
  final CourseModel course;
  bool isScalePrice = false;

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
        child: IntrinsicHeight(
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppDimens.mediumHeightDimens,
                    ),
                    child: DefaultNetworkImage(
                      imageUrl: course.image.url,
                      blurHash: course.image.blurHash,
                      height: height ?? (AppDimens.extraLargeHeightDimens * 6),
                      width: AppDimens.mediumWidthDimens * 20,
                      shape: BoxShape.rectangle,
                      borderRadius: AppDimens.mediumRadius,
                    ),
                  ),
                  SizedBox(width: AppDimens.mediumWidthDimens),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(height: AppDimens.smallHeightDimens),
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
                        const Spacer(),
                        // SizedBox(height: AppDimens.smallHeightDimens),
                        SizedBox(
                          width: AppDimens.mediumWidthDimens * 18,
                          height: AppDimens.extraLargeHeightDimens,
                          child: (course.sale != null && course.sale != 0)
                              ? RichText(
                                  text: TextSpan(
                                    style: isScalePrice
                                        ? AppStyles.headline6TextStyle.copyWith(
                                            color: AppColors.primaryColor,
                                            fontWeight: FontWeight.w900,
                                          )
                                        : AppStyles.subtitle1TextStyle.copyWith(
                                            color: AppColors.primaryColor,
                                            fontWeight: FontWeight.w900,
                                          ),
                                    children: [
                                      TextSpan(
                                        text:
                                            "${(course.price * (1 - course.sale!)).toStringAsFixed(2)}\$\t",
                                      ),
                                      TextSpan(
                                        text:
                                            "${course.price.toStringAsFixed(2)}\$",
                                        style: isScalePrice
                                            ? AppStyles.subtitle1TextStyle
                                                .copyWith(
                                                color:
                                                    AppColors.neutral.shade500,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationColor:
                                                    AppColors.neutral.shade700,
                                                decorationThickness: 2,
                                              )
                                            : AppStyles.subtitle2TextStyle
                                                .copyWith(
                                                color:
                                                    AppColors.neutral.shade500,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationColor:
                                                    AppColors.neutral.shade700,
                                                decorationThickness: 2,
                                              ),
                                      ),
                                    ],
                                  ),
                                )
                              : Text(
                                  "${course.price.toStringAsFixed(1)}\$",
                                  style: isScalePrice
                                      ? AppStyles.headline6TextStyle.copyWith(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w900,
                                        )
                                      : AppStyles.subtitle1TextStyle.copyWith(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w900,
                                        ),
                                ),
                        ),
                        SizedBox(
                          height: isScalePrice
                              ? AppDimens.largeHeightDimens
                              : AppDimens.smallHeightDimens,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                right: AppDimens.mediumWidthDimens,
                bottom: isScalePrice
                    ? AppDimens.largeHeightDimens - AppDimens.smallHeightDimens
                    : AppDimens.smallHeightDimens,
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.orangeAccent,
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
              Positioned(
                right: AppDimens.mediumWidthDimens,
                top: AppDimens.mediumHeightDimens,
                child: BookmarkIcon(isBookmark: Random().nextBool()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
