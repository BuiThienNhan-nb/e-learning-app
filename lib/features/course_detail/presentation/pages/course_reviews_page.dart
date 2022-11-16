import 'package:flutter/material.dart';

import '../../../../bases/presentation/atoms/network_image.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/formats.dart';
import '../../../../configs/styles.dart';
import '../../domain/entities/course_review_model.dart';

class CourseReviewsPage extends StatelessWidget {
  const CourseReviewsPage({
    super.key,
    required this.reviews,
  });

  final List<CourseReviewModel> reviews;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reviews.length,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) =>
          CourseReviewWidget(review: reviews[index]),
    );
  }
}

class CourseReviewWidget extends StatelessWidget {
  const CourseReviewWidget({
    Key? key,
    required this.review,
  }) : super(key: key);

  final CourseReviewModel review;

  @override
  Widget build(BuildContext context) {
    final String dateAgo = AppFormats.instance.timeAgo(review.reviewedAt);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(AppDimens.mediumWidthDimens),
      padding: EdgeInsets.all(AppDimens.largeWidthDimens),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              DefaultNetworkImage(
                imageUrl:
                    "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                blurHash: "LPGcJskWK+wb_Noer=NG.TRjRQt7",
                height: AppDimens.extraLargeHeightDimens * 1.8,
                width: AppDimens.extraLargeWidthDimens * 1.8,
              ),
              SizedBox(width: AppDimens.mediumWidthDimens),
              Expanded(
                child: Text(
                  "Marielle Wigington",
                  style: AppStyles.subtitle1TextStyle.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimens.largeRadius),
                  border: Border.all(color: AppColors.secondaryColor),
                ),
                padding: EdgeInsets.fromLTRB(
                  AppDimens.mediumWidthDimens,
                  AppDimens.smallHeightDimens,
                  AppDimens.mediumWidthDimens,
                  AppDimens.smallHeightDimens,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.secondaryColor,
                      size: AppDimens.largeWidthDimens,
                    ),
                    SizedBox(width: AppDimens.mediumWidthDimens),
                    Text(
                      "${review.rate}",
                      style: AppStyles.subtitle1TextStyle.copyWith(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppDimens.mediumHeightDimens),
          Text(
            review.review,
            style: AppStyles.subtitle1TextStyle,
          ),
          SizedBox(height: AppDimens.smallHeightDimens),
          Text(
            dateAgo,
            style: AppStyles.subtitle2TextStyle.copyWith(
              color: AppColors.neutral.shade600,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
