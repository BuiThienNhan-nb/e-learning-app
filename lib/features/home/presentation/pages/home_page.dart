import 'package:e_learning_app/bases/presentation/atoms/card_page_view.dart';
import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/configs/dimens.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:e_learning_app/features/home/presentation/widgets/continue_lesson_list_view.dart';
import 'package:e_learning_app/features/home/presentation/widgets/discount_card.dart';
import 'package:e_learning_app/features/home/presentation/widgets/home_header.dart';
import 'package:e_learning_app/features/home/presentation/widgets/recomendation_lesson_page_view.dart';
import 'package:flutter/material.dart';

import '../widgets/teacher_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
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
                    SizedBox(height: AppDimens.mediumHeightDimens),
                    const RecommendationLessonPageView(),
                    SizedBox(height: AppDimens.mediumHeightDimens),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
