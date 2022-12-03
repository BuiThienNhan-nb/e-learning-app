import 'dart:developer';

import 'package:e_learning_app/features/course_detail/presentation/widgets/course_add_review_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../bases/presentation/atoms/network_image.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/formats.dart';
import '../../../../configs/styles.dart';
import '../../../../utils/mock/mock_course_reviews.dart';
import '../../domain/entities/course_detail_model.dart';
import '../../domain/entities/course_review_model.dart';

class CourseReviewsPage extends StatelessWidget {
  const CourseReviewsPage({
    super.key,
    required this.course,
  });

  final CourseDetailModel course;

  @override
  Widget build(BuildContext context) {
    final reviews = GetIt.I<MockCourseReviews>().reviews;

    void onSubmit(String value) {
      // Submit comment
      log(value);
    }

    return Stack(
      children: [
        ListView.builder(
          itemCount: reviews.length,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) =>
              CourseReviewWidget(review: reviews[index]),
        ),
        course.isPaid
            ? Positioned(
                right: AppDimens.mediumWidthDimens,
                bottom: AppDimens.mediumHeightDimens,
                child: InkWell(
                  borderRadius: BorderRadius.circular(200),
                  onTap: () => showDialog(
                    context: context,
                    useSafeArea: true,
                    builder: (context) => CourseAddReviewDialog(
                      onFieldSubmitted: (review, rate) async {
                        log("review: $review / rate: $rate");
                        Navigator.of(context).pop();
                        // WidgetsBinding.instance.addPostFrameCallback((_) {
                        //   AppLoading.showLoadingDialog(context);
                        // });
                        // await Future.delayed(const Duration(milliseconds: 1500));
                        // WidgetsBinding.instance.addPostFrameCallback((_) {
                        //   AppLoading.dismissLoadingDialog(context);
                        // });
                      },
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(AppDimens.mediumWidthDimens),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      "assets/icons/paper_plane_fill_icon.png",
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );

    /* GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child:
      !isPaid
          ? ListView.builder(
              itemCount: reviews.length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) =>
                  CourseReviewWidget(review: reviews[index]),
            )
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: AppDimens.mediumHeightDimens),
                  DefaultTextFormField(
                    labelText: "",
                    controller: commentController,
                    suffixIcon: "assets/icons/paper_plane_fill_icon.png",
                    onSuffixIconTap: () =>
                        onSubmit(commentController.text.trim()),
                    onFieldSubmitted: onSubmit,
                  ),
                  SizedBox(height: AppDimens.mediumHeightDimens),
                  ListView.builder(
                    itemCount: reviews.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) =>
                        CourseReviewWidget(review: reviews[index]),
                  ),
                ],
              ),
            ),
    ); */
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
      padding: EdgeInsets.all(AppDimens.largeWidthDimens),
      margin: EdgeInsets.symmetric(vertical: AppDimens.mediumWidthDimens),
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
