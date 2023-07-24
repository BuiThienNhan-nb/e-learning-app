import 'package:e_learning_app/features/top/domain/entities/course_model.dart';
import 'package:flutter/material.dart';

import '../../../../bases/presentation/atoms/network_image.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/styles.dart';

class MyCourseCard extends StatelessWidget {
  const MyCourseCard({
    super.key,
    required this.course,
  });

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
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
            imageUrl: course.image ?? 'null',
            blurHash: "L6Du;]^%DlTw00Io%1i_00XT~Umm",
            height: 90 * 1.2,
            width: 120 * 1.2,
            shape: BoxShape.rectangle,
            borderRadius: AppDimens.mediumRadius,
          ),
          SizedBox(width: AppDimens.mediumWidthDimens),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: AppDimens.extraLargeHeightDimens * 0.25),
                Text(
                  course.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
                SizedBox(height: AppDimens.smallHeightDimens),
                Text(
                  course.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: AppColors.textGray999),
                ),
                SizedBox(height: AppDimens.smallHeightDimens),
                Text(
                  "12,432 enrolled • 11 months ago",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: AppColors.textGray999),
                ),
                const Spacer(),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orangeAccent,
                    ),
                    Text(
                      "4.3",
                      style: AppStyles.subtitle2TextStyle,
                    ),
                    // SvgPicture.asset(
                    //   "assets/icons/comment_icon.svg",
                    //   color: AppColors.neutral.shade600,
                    //   fit: BoxFit.scaleDown,
                    // ),
                    // const Text("45"),
                  ],
                ),
                SizedBox(height: AppDimens.extraLargeHeightDimens * 0.25),
              ],
            ),
          ),
          SizedBox(width: AppDimens.mediumWidthDimens),
        ],
      ),
    );
  }
}
