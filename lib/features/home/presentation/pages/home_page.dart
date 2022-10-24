import 'package:e_learning_app/bases/presentation/atoms/card_page_view.dart';
import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/configs/dimens.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:e_learning_app/features/home/presentation/widgets/discount_card.dart';
import 'package:e_learning_app/features/home/presentation/widgets/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../bases/presentation/atoms/hor_lesson_card.dart';

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
                    SizedBox(height: AppDimens.extraLargeHeightDimens),
                    CardPageView(
                      height: AppDimens.extraLargeHeightDimens * 7,
                      // width: AppDimens.appDesignSize.width -
                      //     (AppDimens.extraLargeWidthDimens * 2),
                      pages: const [
                        DiscountCard(),
                        DiscountCard(),
                        DiscountCard(),
                        DiscountCard(),
                        DiscountCard(),
                      ],
                    ),
                    SizedBox(height: AppDimens.largeHeightDimens),

                    Padding(
                      padding:
                          EdgeInsets.only(left: AppDimens.largeWidthDimens),
                      child: Text(
                        "Continue to learn",
                        style: AppStyles.headline6TextStyle
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: AppDimens.mediumHeightDimens),
                    SizedBox(
                      height: AppDimens.extraLargeHeightDimens * 6,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(
                          left: AppDimens.largeWidthDimens,
                          right: AppDimens.largeWidthDimens,
                        ),
                        itemBuilder: (_, index) => ContinueLessonCard(
                          leftPadding:
                              index != 0 ? AppDimens.mediumWidthDimens : null,
                          height: AppDimens.extraLargeHeightDimens * 6,
                        ),
                      ),
                    ),

                    // Pretend this gonna be another section of home page
                    SizedBox(height: AppDimens.extraLargeHeightDimens),
                    Padding(
                      padding:
                          EdgeInsets.only(left: AppDimens.largeWidthDimens),
                      child: Text(
                        "Continue to learn",
                        style: AppStyles.headline6TextStyle
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: AppDimens.mediumHeightDimens),
                    SizedBox(
                      height: AppDimens.extraLargeHeightDimens * 7,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(
                          left: AppDimens.largeWidthDimens,
                          right: AppDimens.largeWidthDimens,
                        ),
                        itemBuilder: (_, index) => ContinueLessonCard(
                          leftPadding:
                              index != 0 ? AppDimens.mediumWidthDimens : null,
                          height: AppDimens.extraLargeHeightDimens * 7,
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimens.extraLargeHeightDimens),
                    Padding(
                      padding:
                          EdgeInsets.only(left: AppDimens.largeWidthDimens),
                      child: Text(
                        "Continue to learn",
                        style: AppStyles.headline6TextStyle
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: AppDimens.mediumHeightDimens),
                    SizedBox(
                      height: AppDimens.extraLargeHeightDimens * 6,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(
                          left: AppDimens.largeWidthDimens,
                          right: AppDimens.largeWidthDimens,
                        ),
                        itemBuilder: (_, index) => ContinueLessonCard(
                          leftPadding:
                              index != 0 ? AppDimens.mediumWidthDimens : null,
                          height: AppDimens.extraLargeHeightDimens * 6,
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimens.extraLargeHeightDimens),
                    Padding(
                      padding:
                          EdgeInsets.only(left: AppDimens.largeWidthDimens),
                      child: Text(
                        "Continue to learn",
                        style: AppStyles.headline6TextStyle
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: AppDimens.mediumHeightDimens),
                    SizedBox(
                      height: AppDimens.extraLargeHeightDimens * 6,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(
                          left: AppDimens.largeWidthDimens,
                          right: AppDimens.largeWidthDimens,
                        ),
                        itemBuilder: (_, index) => ContinueLessonCard(
                          leftPadding:
                              index != 0 ? AppDimens.mediumWidthDimens : null,
                          height: AppDimens.extraLargeHeightDimens * 6,
                        ),
                      ),
                    ),
                    // Ending
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
