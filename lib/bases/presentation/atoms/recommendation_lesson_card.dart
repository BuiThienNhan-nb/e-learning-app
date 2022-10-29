import 'dart:math';

import 'package:e_learning_app/bases/presentation/atoms/bookmark_icon.dart';
import 'package:e_learning_app/bases/presentation/atoms/network_image.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:flutter/material.dart';

import '../../../configs/colors.dart';
import '../../../configs/dimens.dart';

class RecommendationLessonCard extends StatelessWidget {
  const RecommendationLessonCard({
    super.key,
    required this.isDiscount,
    this.height,
  });

  final bool isDiscount;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1,
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
          border: Border.all(color: AppColors.neutral.shade200),
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
              imageUrl:
                  "https://images.unsplash.com/photo-1666688090267-4858c2075629?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
              blurHash: "LUE{|Z~qNeIV0LE2WAozIpR+t6oI",
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
                        "3D Design",
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
                        "3D Design Illustrations class (2022 updated)",
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
                      child: isDiscount
                          ? RichText(
                              text: TextSpan(
                                style: AppStyles.headline6TextStyle.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w900,
                                ),
                                children: [
                                  const TextSpan(
                                    text: "40\$\t\t",
                                  ),
                                  TextSpan(
                                    text: "80\$",
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
                              "80\$",
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
                  bottom: AppDimens.largeHeightDimens,
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
                          "\t4.2",
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
