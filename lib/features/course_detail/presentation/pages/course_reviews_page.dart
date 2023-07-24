import 'package:e_learning_app/bases/mobx/base_state.dart';
import 'package:e_learning_app/bases/presentation/atoms/loading_dialog.dart';
import 'package:e_learning_app/features/auth/sign_in/domain/usecases/auth_use_case.dart';
import 'package:e_learning_app/features/auth/sign_in/domain/usecases/auth_use_case/get_user_by_id_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../../bases/presentation/atoms/network_image.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/formats.dart';
import '../../../../configs/styles.dart';
import '../../domain/entities/course_detail_model.dart';
import '../../domain/entities/course_review_model.dart';
import '../states/course_rate_store.dart';
import '../widgets/course_add_review_dialog.dart';

class CourseReviewsPage extends StatelessWidget {
  const CourseReviewsPage({
    super.key,
    required this.course,
  });

  final CourseDetailModel course;

  @override
  Widget build(BuildContext context) {
    // final reviews = GetIt.I<MockCourseReviews>().reviews;
    final store = context.read<CourseRateStore>();

    void onSubmit(String value) {
      // Submit comment
      print(value);
    }

    return Observer(
      builder: (_) {
        if (store.getReviewsState == BaseSate.init) {
          store.getCourseReview(course.id);
        }
        return store.getReviewsState == BaseSate.loaded
            ? Stack(
                children: [
                  ListView.builder(
                    itemCount: store.reviews!.reversed.toList().length,
                    physics: const NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) =>
                        CourseReviewWidget(review: store.reviews![index]),
                  ),
                  course.isEnrolled
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
                                  print("review: $review / rate: $rate");
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
                              padding:
                                  EdgeInsets.all(AppDimens.mediumWidthDimens),
                              decoration: BoxDecoration(
                                color:
                                    AppColors.secondaryColor.withOpacity(0.2),
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
              )
            : store.getReviewsState == BaseSate.loading
                ? const LoadingWidget()
                : Text(store.errorMessage ?? "Unexpected error!");
      },
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

class CourseReviewWidget extends StatefulWidget {
  const CourseReviewWidget({
    Key? key,
    required this.review,
  }) : super(key: key);

  final CourseReviewModel review;

  @override
  State<CourseReviewWidget> createState() => _CourseReviewWidgetState();
}

class _CourseReviewWidgetState extends State<CourseReviewWidget> {
  bool isLoading = true;
  String avatar = 'null';
  String name = 'Name';

  @override
  void initState() {
    fetchUser();
    super.initState();
  }

  void fetchUser() async {
    final data = await GetIt.I<AuthUseCase>().getUserUseCase(
      GetUserByIdParams(widget.review.userId),
    );
    data.fold(
      (l) => debugPrint(l.message),
      (r) {
        avatar = r.avatar ?? 'null';
        name = r.name;
      },
    );
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String dateAgo = AppFormats.instance.timeAgo(widget.review.createdAt);
    return isLoading
        ? Container(
            width: double.infinity,
            height: 90,
            padding: EdgeInsets.all(AppDimens.largeWidthDimens),
            decoration: BoxDecoration(
              color: AppColors.placeholderLightMode,
              borderRadius: BorderRadius.circular(AppDimens.largeRadius),
            ),
          )
        : Container(
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
                      imageUrl: avatar,
                      blurHash: "LPGcJskWK+wb_Noer=NG.TRjRQt7",
                      height: AppDimens.extraLargeHeightDimens * 1.8,
                      width: AppDimens.extraLargeWidthDimens * 1.8,
                    ),
                    SizedBox(width: AppDimens.mediumWidthDimens),
                    Expanded(
                      child: Text(
                        name,
                        style: AppStyles.subtitle1TextStyle.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimens.largeRadius),
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
                            "${widget.review.score}",
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
                  widget.review.comment,
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
