import 'dart:math';

import 'package:e_learning_app/configs/styles.dart';
import 'package:flutter/material.dart';

import '../../../configs/colors.dart';
import '../../../configs/dimens.dart';
import 'network_image.dart';

class ContinueLessonCard extends StatelessWidget {
  const ContinueLessonCard({
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
        border: Border.all(color: AppColors.neutral.shade400),
        borderRadius: BorderRadius.circular(AppDimens.largeRadius),
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
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: AppColors.neutral.shade400,
                            color: AppColors.primaryColor,
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
            url:
                "https://i.kinja-img.com/gawker-media/image/upload/q_75,w_1200,h_900,c_fill/8df231ec8f1266779a6908117e0650ac.JPG",
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
