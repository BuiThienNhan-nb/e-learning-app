import 'dart:math';
import 'package:e_learning_app/bases/presentation/atoms/text_button.dart';
import 'package:e_learning_app/features/course_detail/domain/entities/course_detail_model.dart';
import 'package:e_learning_app/features/course_detail/presentation/pages/course_lesson_page.dart';
import 'package:e_learning_app/features/course_detail/presentation/pages/course_reviews_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../../bases/presentation/atoms/network_image.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../utils/mock/mock_course_reviews.dart';
import '../../../../utils/mock/mock_courses.dart';
import '../../../home/domain/entities/course_model.dart';
import '../widgets/sliver_app_bar_tab.dart';
import 'course_about_page.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({
    super.key,
    required this.courseId,
  });

  final String courseId;

  @override
  Widget build(BuildContext context) {
    final List<CourseModel> courses = GetIt.I<MockCourses>().recommendedLessons;
    final CourseModel a = GetIt.I<MockCourses>()
        .recommendedLessons
        .firstWhere((element) => element.id == courseId);
    final CourseDetailModel course = CourseDetailModel(
      course: a,
      teacherId: "1",
      isPaid: Random().nextBool(),
    );
    final List<Widget> tabs = [
      const Tab(
        text: "About",
      ),
      const Tab(
        text: "Lessons",
      ),
      const Tab(
        text: "Reviews",
      ),
    ];

    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          DefaultNetworkImage(
            imageUrl: course.image.url,
            blurHash: course.image.blurHash,
            height: AppDimens.extraLargeHeightDimens * 18,
            width: double.infinity,
            shape: BoxShape.rectangle,
            borderRadius: AppDimens.mediumRadius,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: !course.isPaid
                ? DefaultTextButton(
                    submit: () {},
                    title:
                        "Enroll Course now - ${course.price.toStringAsFixed(2)}\$",
                    width: AppDimens.appDesignSize.width -
                        AppDimens.extraLargeWidthDimens * 2,
                  )
                : null,
            body: DefaultTabController(
              length: tabs.length,
              child: NestedScrollView(
                physics: const NeverScrollableScrollPhysics(),
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    floating: true,
                    forceElevated: innerBoxIsScrolled,
                    pinned: true,
                    // toolbarHeight: AppDimens.extraLargeHeightDimens * 8,
                    // leadingWidth: AppDimens.extraLargeHeightDimens * 8,
                    // flexibleSpace: FlexibleSpaceBar(
                    //   collapseMode: CollapseMode.pin,
                    //   background: Container(
                    //     padding: EdgeInsets.only(
                    //         bottom: AppDimens.extraLargeWidthDimens * 2),
                    //     decoration: const BoxDecoration(
                    //       gradient: LinearGradient(
                    //         colors: [
                    //           Colors.transparent,
                    //           AppColors.lightWhiteColor,
                    //         ],
                    //         begin: Alignment.topCenter,
                    //         end: Alignment.bottomCenter,
                    //       ),
                    //     ),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       mainAxisAlignment: MainAxisAlignment.end,
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         Text(
                    //           course.title,
                    //           style: const TextStyle(
                    //             color: AppColors.blackColor,
                    //             fontWeight: FontWeight.w900,
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    bottom: SliverAppBarTab(
                      color: AppColors.whiteColor,
                      tabBar: TabBar(
                        tabs: tabs,
                        labelColor: AppColors.primaryColor,
                        indicator: MaterialIndicator(
                          tabPosition: TabPosition.bottom,
                          color: AppColors.primaryColor,
                          strokeWidth: 1,
                          horizontalPadding: AppDimens.extraLargeWidthDimens,
                          // distanceFromCenter: 16,
                          // radius: 3,
                          paintingStyle: PaintingStyle.fill,
                        ),
                      ),
                    ),
                    expandedHeight: MediaQuery.of(context).size.height / 1.6,
                    automaticallyImplyLeading: true,
                    primary: false,
                  ),
                ],
                body: Container(
                  color: AppColors.whiteColor,
                  padding: EdgeInsets.all(AppDimens.mediumWidthDimens),
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      CourseAboutPage(course: course),
                      CourseLessonPage(course: course),
                      CourseReviewsPage(
                          reviews: GetIt.I<MockCourseReviews>().reviews),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
