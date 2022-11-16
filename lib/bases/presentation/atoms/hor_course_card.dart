import 'dart:math';

import 'package:e_learning_app/configs/styles.dart';
import 'package:flutter/material.dart';

import '../../../configs/colors.dart';
import '../../../configs/dimens.dart';
import 'network_image.dart';

class ContinueCourseCard extends StatelessWidget {
  const ContinueCourseCard({
    Key? key,
    required this.height,
    this.leftPadding,
  }) : super(key: key);

  final double? leftPadding;
  final double height;

  @override
  Widget build(BuildContext context) {
    final progress = Random().nextDouble();
    return Container(
      // height: AppDimens.extraLargeHeightDimens * 10,
      margin: EdgeInsets.only(left: leftPadding ?? 0.0),
      padding: EdgeInsets.all(AppDimens.mediumWidthDimens),
      width: AppDimens.mediumWidthDimens * 38,
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
            spreadRadius: 0.4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: AppDimens.mediumWidthDimens * 22,
            child: SizedBox(
              height: height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Interface design",
                    style: AppStyles.subtitle2TextStyle,
                  ),
                  Text(
                    "UI/UX Prototyping!! Sales till end of 2022! Join now!",
                    style: AppStyles.subtitle1TextStyle
                        .copyWith(fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: AppDimens.mediumHeightDimens),
                  SizedBox(
                    width: AppDimens.mediumWidthDimens * 16,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(
                          "\t4.7 (2.440 ratings)",
                          style: AppStyles.subtitle2TextStyle,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: AppDimens.mediumWidthDimens * 16,
                    child: Row(
                      children: [
                        SizedBox(
                          width: AppDimens.mediumWidthDimens * 10,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                AppDimens.extraItemRadius),
                            child: LinearProgressIndicator(
                              value: progress,
                              backgroundColor: AppColors.neutral.shade400,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        Text(
                          "\t\t${(progress * 100).toStringAsFixed(2)}%",
                          style: AppStyles.subtitle2TextStyle,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          DefaultNetworkImage(
            imageUrl:
                "https://images.unsplash.com/photo-1666688090267-4858c2075629?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
            blurHash: "LUE{|Z~qNeIV0LE2WAozIpR+t6oI",
            height: (height / 6) * 4.4,
            width: AppDimens.mediumWidthDimens * 12,
            shape: BoxShape.rectangle,
            borderRadius: AppDimens.mediumRadius,
          ),
        ],
      ),
    );
  }
}
