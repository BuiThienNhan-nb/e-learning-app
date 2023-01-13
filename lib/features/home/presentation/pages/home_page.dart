import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../bases/presentation/atoms/card_page_view.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/styles.dart';
import '../widgets/continue_lesson_list_view.dart';
import '../widgets/discount_card.dart';
import '../widgets/home_header.dart';
import '../widgets/recomendation_courses_page_view.dart';
import '../widgets/teacher_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        log("Refreshing...");
        setState(() {});
      },
      child: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
              delegate: HomeHeader(),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardPageView(
                        height: AppDimens.extraLargeHeightDimens * 6.4,
                        pages: const [
                          DiscountCard(),
                          DiscountCard(),
                          DiscountCard(),
                          DiscountCard(),
                          DiscountCard(),
                        ],
                      ),
                      SizedBox(height: AppDimens.largeHeightDimens),
                      Text(
                        "\t\t\tTop Mentors",
                        style: AppStyles.headline6TextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TeacherListView(
                        height: AppDimens.extraLargeHeightDimens * 5,
                      ),
                      SizedBox(height: AppDimens.largeHeightDimens),
                      Text(
                        "\t\t\tContinue to learn",
                        style: AppStyles.headline6TextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: AppDimens.mediumHeightDimens),
                      ContinueLessonListView(
                        height: AppDimens.extraLargeHeightDimens * 6,
                      ),
                      SizedBox(height: AppDimens.largeHeightDimens),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\t\t\tRecommendation",
                            style: AppStyles.headline6TextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "See all lessons",
                              style: AppStyles.subtitle1TextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: AppDimens.mediumHeightDimens),
                      // ignore: prefer_const_constructors
                      RecommendationCoursePageView(),
                      SizedBox(height: AppDimens.mediumHeightDimens),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
