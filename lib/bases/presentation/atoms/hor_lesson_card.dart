import 'dart:math';

import 'package:e_learning_app/configs/styles.dart';
import 'package:flutter/material.dart';

import '../../../configs/colors.dart';
import '../../../configs/dimens.dart';
import 'network_image.dart';

class ContinueLessonCard extends StatelessWidget {
  const ContinueLessonCard({
    Key? key,
    this.leftPadding,
  }) : super(key: key);

  final double? leftPadding;

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
              height: AppDimens.extraLargeHeightDimens * 8,
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
                  ),
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
            height: AppDimens.extraLargeHeightDimens * 5,
            width: AppDimens.mediumWidthDimens * 12,
            shape: BoxShape.rectangle,
            borderRadius: AppDimens.mediumRadius,
          ),
        ],
      ),

      /*
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              DefaultNetworkImage(
                url:
                    "https://i.kinja-img.com/gawker-media/image/upload/q_75,w_1200,h_900,c_fill/8df231ec8f1266779a6908117e0650ac.JPG",
                height: AppDimens.extraLargeHeightDimens * 8,
                width: AppDimens.mediumWidthDimens * 18,
                shape: BoxShape.rectangle,
                borderRadius: AppDimens.mediumRadius,
              ),
              ClipOval(
                child: BackdropFilter(
                  blendMode: BlendMode.srcOver,
                  filter: ImageFilter.blur(
                    sigmaX: 3.0,
                    sigmaY: 3.0,
                  ),
                  child: Container(
                    height: AppDimens.extraLargeHeightDimens * 3.6,
                    width: AppDimens.mediumWidthDimens * 9,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.play_circle_outline,
                color: AppColors.neutral.shade300,
                size: AppDimens.extraLargeHeightDimens * 4,
              ),
            ],
          ),
          LinearProgressIndicator(
            value: Random().nextDouble(),
            backgroundColor: AppColors.neutral.shade400,
            color: AppColors.primaryColor,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: AppDimens.mediumWidthDimens),
                const Icon(
                  Icons.info_outline_rounded,
                  color: AppColors.whiteColor,
                ),
                const Spacer(),
                const Icon(
                  Icons.more_vert,
                  color: AppColors.whiteColor,
                ),
                SizedBox(width: AppDimens.mediumWidthDimens),
              ],
            ),
          ),
        ],
      ),*/
    );
  }
}
