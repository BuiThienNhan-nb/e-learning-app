import 'dart:developer' as logger;
import 'dart:math';

import 'package:e_learning_app/core/app/provider.dart';
import 'package:e_learning_app/features/course_detail/domain/entities/course_review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../bases/presentation/atoms/bookmark_icon.dart';
import '../../../../bases/presentation/atoms/network_image.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/formats.dart';
import '../../../../configs/styles.dart';
import '../../domain/entities/course_detail_model.dart';
import '../states/course_rate_store.dart';
import '../widgets/course_add_review_dialog.dart';
import '../widgets/course_detail_interaction.dart';

class CourseAboutPage extends StatelessWidget {
  const CourseAboutPage({
    super.key,
    required this.course,
  });

  final CourseDetailModel course;

  @override
  Widget build(BuildContext context) {
    final store = context.read<CourseRateStore>();
    store.setCourseRate(course.rates);
    store.setCourseRateCount(course.votes);

    // final TeacherModel teacher =
    // GetIt.I<MockTeachers>()
    //     .topTeachers
    //     .firstWhere((element) => element.id == course.teacherId);

    return Observer(
      builder: (_) {
        if (store.state == BaseSate.init) {
          store.getCourseRate(course.id);
        }

        return SingleChildScrollView(
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(AppDimens.mediumWidthDimens),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: AppDimens.mediumHeightDimens),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            course.title,
                            style: AppStyles.headline5TextStyle
                                .copyWith(fontWeight: FontWeight.w900),
                          ),
                        ),
                        SizedBox(width: AppDimens.largeWidthDimens),
                        BookmarkIcon(isBookmark: Random().nextBool()),
                      ],
                    ),
                    SizedBox(height: AppDimens.largeHeightDimens),
                    store.state == BaseSate.loading
                        ? const CircularProgressIndicator()
                        : store.state == BaseSate.error
                            ? Text(store.errorMessage ?? "Error!")
                            : InkWell(
                                onTap: () => showDialog(
                                  context: context,
                                  useSafeArea: true,
                                  builder: (context) => CourseAddReviewDialog(
                                    onFieldSubmitted: (review, rate) async {
                                      print("review: $review / rate: $rate");
                                      Navigator.of(context).pop();
                                      store.rateCourse(
                                        CourseReviewModel(
                                          id: "",
                                          userId:
                                              GetIt.I<AppProvider>().user.id,
                                          courseId: course.id,
                                          score: rate,
                                          comment: review,
                                          createdAt: DateTime.now(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(
                                          AppDimens.mediumHeightDimens),
                                      decoration: BoxDecoration(
                                        color: AppColors.subThemeColor,
                                        borderRadius: BorderRadius.circular(
                                            AppDimens.mediumRadius),
                                      ),
                                      child: Text(
                                        course.category.first,
                                        style: AppStyles.subtitle2TextStyle
                                            .copyWith(
                                          color: AppColors.secondaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                        width: AppDimens.mediumWidthDimens),
                                    Text(
                                      store.currentRate == null
                                          ? "0"
                                          : "\t${store.currentRate!}",
                                      style:
                                          AppStyles.subtitle1TextStyle.copyWith(
                                        fontWeight: FontWeight.w800,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Icon(
                                      course.rates == 5.0
                                          ? Icons.star
                                          : Icons.star_half,
                                      color: store.currentRate == null
                                          ? AppColors.neutral.shade500
                                          : Colors.orangeAccent,
                                    ),
                                    Text(
                                      "\t${store.courseRate.toStringAsFixed(2)}",
                                      style: AppStyles.subtitle2TextStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(width: AppDimens.smallWidthDimens),
                                    Text(
                                      "(${AppFormats.instance.oCcy.format(store.courseRateCount)} reviews)",
                                      style: AppStyles.subtitle2TextStyle,
                                    ),
                                  ],
                                ),
                              ),
                    SizedBox(height: AppDimens.largeHeightDimens),
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
                                        "\t${(course.price * (1 - course.sale!)).toStringAsFixed(2)}\$\t\t",
                                  ),
                                  TextSpan(
                                    text:
                                        "${course.price.toStringAsFixed(2)}\$",
                                    style:
                                        AppStyles.subtitle1TextStyle.copyWith(
                                      color: AppColors.neutral.shade500,
                                      decorationColor:
                                          AppColors.neutral.shade700,
                                      decorationThickness: 2,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Text(
                              "\t${course.price.toStringAsFixed(2)}\$",
                              style: AppStyles.headline6TextStyle.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                    ),
                    SizedBox(height: AppDimens.largeHeightDimens),
                    CourseDetailInteraction(course: course),
                    const Divider(
                      thickness: 1.2,
                    ),
                    SizedBox(height: AppDimens.mediumWidthDimens),
                    const Text(
                      "Mentor",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: AppDimens.mediumWidthDimens),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DefaultNetworkImage(
                          imageUrl: course.teacher.avatar!,
                          blurHash: "LLHn?Bs:.mS\$-:t6WBjZENRkrrs.",
                          height: AppDimens.extraLargeHeightDimens * 2.4,
                          width: AppDimens.extraLargeWidthDimens * 2.4,
                        ),
                        SizedBox(width: AppDimens.smallWidthDimens),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                course.teacher.name,
                                style: AppStyles.subtitle1TextStyle.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                "This is teacher bio!",
                                style: AppStyles.subtitle2TextStyle,
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          "assets/icons/messenger_icon.png",
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                    SizedBox(height: AppDimens.mediumWidthDimens),
                    const Text(
                      "About Course",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: AppDimens.mediumWidthDimens),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        course.description,
                        style: AppStyles.subtitle1TextStyle,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
