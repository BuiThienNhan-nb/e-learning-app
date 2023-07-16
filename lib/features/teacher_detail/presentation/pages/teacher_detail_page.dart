import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../bases/presentation/atoms/loading_dialog.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/styles.dart';
import '../../../../utils/mock/mock_teacher_reviews.dart';
import '../../../../utils/mock/mock_teachers.dart';
import '../states/teacher_detail_store.dart';
import '../widgets/teacher_interact_button.dart';
import '../widgets/teacher_interaction.dart';
import 'related_teacher_page.dart';
import 'teacher_courses_page.dart';
import 'teacher_reviews_page.dart';

class TeacherDetailPage extends StatelessWidget {
  const TeacherDetailPage({
    super.key,
    required this.teacherId,
  });

  final String teacherId;

  @override
  Widget build(BuildContext context) {
    final store = context.read<TeacherDetailStore>();
    // final TeacherModel teacher = GetIt.I<MockTeachers>().topTeachers.firstWhere(
    //       (element) => element.id == teacherId,
    //     );
    // final List<CourseModel> courses = GetIt.I<MockCourses>().recommendedLessons;

    final List<Widget> tabs = [
      const Tab(
        text: "Teacher's courses",
      ),
      const Tab(
        text: "Reviews",
      ),
      const Tab(
        text: "Related Mentors",
      ),
    ];

    return Observer(
      builder: (_) {
        if (store.getTeacherState == BaseSate.init) {
          store.getTeacherById(teacherId);
        }

        return DefaultTabController(
          length: tabs.length,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              backgroundColor: AppColors.whiteColor,
              iconTheme: IconThemeData(
                color: AppColors.blackColor,
                size: AppDimens.extraLargeWidthDimens,
              ),
              actionsIconTheme: const IconThemeData(
                color: AppColors.blackColor,
              ),
              title: Text(
                store.teacher == null ? "" : store.teacher!.name,
                style: AppStyles.headline5TextStyle.copyWith(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              elevation: 0,
            ),
            body: store.getTeacherState == BaseSate.loaded
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: AppDimens.extraLargeHeightDimens),
                      TeacherInteraction(teacher: store.teacher!),
                      SizedBox(height: AppDimens.mediumHeightDimens),
                      Text(
                        "\t\tThis is Teacher's bio!",
                        style: AppStyles.subtitle1TextStyle,
                      ),
                      SizedBox(height: AppDimens.largeHeightDimens),
                      TeacherInteractButtonRow(teacherId: teacherId),
                      SizedBox(height: AppDimens.mediumHeightDimens),
                      Divider(
                        color: AppColors.primaryColor,
                        indent: AppDimens.largeWidthDimens,
                        endIndent: AppDimens.largeWidthDimens,
                      ),
                      TabBar(
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
                      // Divider(
                      //   color: AppColors.primaryColor,
                      //   indent: AppDimens.largeWidthDimens,
                      //   endIndent: AppDimens.largeWidthDimens,
                      // ),
                      Expanded(
                        child: TabBarView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            TeacherCoursesPage(
                              // courses: courses,
                              store: store,
                              teacherId: teacherId,
                            ),
                            ReviewPage(
                                reviews: GetIt.I<MockTeacherReviews>().reviews),
                            RelatedTeacherPage(
                                teachers: GetIt.I<MockTeachers>().topTeachers),
                          ],
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: store.getTeacherState == BaseSate.loading
                        ? const LoadingWidget()
                        : Text(
                            store.errorMessage ?? "Unexpected error!!",
                            style: AppStyles.subtitle1TextStyle,
                          ),
                  ),
          ),
        );
      },
    );
  }
}
