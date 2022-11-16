import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'bases/presentation/atoms/bookmark_icon.dart';
import 'bases/presentation/atoms/network_image.dart';
import 'configs/colors.dart';
import 'configs/dimens.dart';
import 'configs/formats.dart';
import 'configs/styles.dart';
import 'features/course_detail/presentation/widgets/course_detail_interaction.dart';
import 'features/home/domain/entities/course_model.dart';
import 'utils/mock/mock_courses.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CourseModel course = GetIt.I<MockCourses>().recommendedLessons[2];

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: AppDimens.extraLargeHeightDimens * 10,
              flexibleSpace: DefaultNetworkImage(
                imageUrl: course.image.url,
                blurHash: course.image.blurHash,
                height: AppDimens.extraLargeHeightDimens * 10,
                width: AppDimens.mediumWidthDimens * 20,
                shape: BoxShape.rectangle,
                borderRadius: AppDimens.mediumRadius,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                left: AppDimens.largeWidthDimens,
                right: AppDimens.largeWidthDimens,
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(height: AppDimens.mediumHeightDimens),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: AppDimens.appDesignSize.width -
                              AppDimens.extraLargeWidthDimens,
                          child: Text(
                            course.title,
                            style: AppStyles.headline5TextStyle
                                .copyWith(fontWeight: FontWeight.w900),
                          ),
                        ),
                        BookmarkIcon(isBookmark: Random().nextBool()),
                      ],
                    ),
                    SizedBox(height: AppDimens.largeHeightDimens),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                        SizedBox(width: AppDimens.mediumWidthDimens),
                        const Icon(
                          Icons.star_half,
                          color: Colors.orangeAccent,
                        ),
                        Text(
                          "\t${course.rates.toStringAsFixed(2)}",
                          style: AppStyles.subtitle2TextStyle,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: AppDimens.smallWidthDimens),
                        Text(
                          "(${AppFormats.instance.oCcy.format(course.votes)} reviews)",
                          style: AppStyles.subtitle2TextStyle,
                        ),
                      ],
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
                      thickness: 1.6,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
