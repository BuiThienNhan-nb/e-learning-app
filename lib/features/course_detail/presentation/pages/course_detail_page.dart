import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../bases/presentation/atoms/default_result_dialog.dart';
import '../../../../bases/presentation/atoms/loading_dialog.dart';
import '../../../../bases/presentation/atoms/network_image.dart';
import '../../../../bases/presentation/atoms/text_button.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../core/app/loading.dart';
import '../../../../core/app/provider.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../states/course_detail_store.dart';
import '../widgets/sliver_app_bar_tab.dart';
import 'course_about_page.dart';
import 'course_lesson_page.dart';
import 'course_reviews_page.dart';

class CourseDetailPage extends StatelessWidget {
  CourseDetailPage({
    super.key,
    required this.courseId,
    this.isEditing = false,
  });

  final String courseId;
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    // final List<CourseModel> courses = GetIt.I<MockCourses>().recommendedLessons;
    // final CourseModel a = GetIt.I<MockCourses>()
    //     .recommendedLessons
    //     .firstWhere((element) => element.id == courseId);
    // final CourseDetailModel course = CourseDetailModel(
    //   course: a,
    //   teacher: GetIt.I<MockTeachers>().topTeachers.firstWhere(
    //         (element) => element.id == "1",
    //       ),
    //   isEnrolled: Random().nextBool(),
    // );
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
    final store = GetIt.I<CourseDetailStore>();

    return Observer(
      builder: (_) {
        if (store.state == BaseSate.init) {
          store.getCourseDetail(courseId);
        }
        // if (store.state == BaseSate.loaded) {
        //   course.rates = store.courseDetail!.rates;
        //   course.votes = store.courseDetail!.votes;
        // }

        // Trigger UI
        if (store.joinState == BaseSate.loading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AppLoading.showLoadingDialog(context);
          });
        }
        if (store.joinState == BaseSate.error || store.errorMessage != null) {
          log(store.errorMessage ?? "Error");
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AppLoading.dismissLoadingDialog(context);
            showDialog(
              context: context,
              builder: (_) => DefaultResultDialog(
                content:
                    store.errorMessage ?? LocaleKeys.serverUnexpectedError.tr(),
                isError: true,
              ),
            );
          });
        } else if (store.joinState == BaseSate.loaded) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              GetIt.I<AppProvider>().user = store.user!;
              store.courseDetail!.isEnrolled = true;
              AppLoading.dismissLoadingDialog(context);
            },
          );
        }

        return SafeArea(
          child: store.state == BaseSate.loading
              ? const Scaffold(
                  body: LoadingWidget(),
                )
              : store.state == BaseSate.error
                  ? Scaffold(
                      body: Center(
                        child: Text(store.errorMessage ?? "Error!!"),
                      ),
                    )
                  : Stack(
                      fit: StackFit.expand,
                      children: [
                        store.courseDetail!.image == null
                            ? Container(
                                height: AppDimens.extraLargeHeightDimens * 18,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppDimens.mediumRadius),
                                ),
                                // clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: const Center(
                                  child: Icon(
                                    Icons.image,
                                  ),
                                ),
                              )
                            : DefaultNetworkImage(
                                imageUrl: store.courseDetail!.image!,
                                blurHash: "L6Du;]^%DlTw00Io%1i_00XT~Umm",
                                height: AppDimens.extraLargeHeightDimens * 18,
                                width: double.infinity,
                                shape: BoxShape.rectangle,
                                borderRadius: AppDimens.mediumRadius,
                              ),
                        Scaffold(
                          resizeToAvoidBottomInset: false,
                          backgroundColor: Colors.transparent,
                          floatingActionButtonLocation:
                              FloatingActionButtonLocation.centerFloat,
                          floatingActionButton: !store.courseDetail!.isEnrolled
                              ? DefaultTextButton(
                                  submit: () {
                                    store.joinCourse(
                                      GetIt.I<AppProvider>().user.id,
                                      courseId,
                                    );
                                  },
                                  title:
                                      "Enroll Course now!!", //- ${course.price.toStringAsFixed(2)}\$",
                                  width: AppDimens.appDesignSize.width -
                                      AppDimens.extraLargeWidthDimens * 2,
                                )
                              : null,
                          body: DefaultTabController(
                            length: tabs.length,
                            child: NestedScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              headerSliverBuilder:
                                  (context, innerBoxIsScrolled) => [
                                SliverAppBar(
                                  backgroundColor: Colors.transparent,
                                  floating: true,
                                  forceElevated: innerBoxIsScrolled,
                                  pinned: true,
                                  bottom: SliverAppBarTab(
                                    color: AppColors.whiteColor,
                                    tabBar: TabBar(
                                      tabs: tabs,
                                      labelColor: AppColors.primaryColor,
                                      indicator: MaterialIndicator(
                                        tabPosition: TabPosition.bottom,
                                        color: AppColors.primaryColor,
                                        strokeWidth: 1,
                                        horizontalPadding:
                                            AppDimens.extraLargeWidthDimens,
                                        // distanceFromCenter: 16,
                                        // radius: 3,
                                        paintingStyle: PaintingStyle.fill,
                                      ),
                                    ),
                                  ),
                                  expandedHeight:
                                      MediaQuery.of(context).size.height / 1.6,
                                  automaticallyImplyLeading: true,
                                  primary: false,
                                ),
                              ],
                              body: Container(
                                color: AppColors.whiteColor,
                                padding:
                                    EdgeInsets.all(AppDimens.mediumWidthDimens),
                                child: TabBarView(
                                  physics: const BouncingScrollPhysics(),
                                  children: [
                                    CourseAboutPage(
                                        course: store.courseDetail!),
                                    CourseLessonPage(
                                        course: store.courseDetail!),
                                    CourseReviewsPage(
                                        course: store.courseDetail!),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
        );
      },
    );
  }
}
