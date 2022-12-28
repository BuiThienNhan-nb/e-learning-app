import 'dart:developer';

import 'package:e_learning_app/bases/mobx/base_state.dart';
import 'package:e_learning_app/bases/presentation/atoms/loading_dialog.dart';
import 'package:e_learning_app/features/my_courses/presentation/pages/update_course/update_section/update_course_section_page.dart';
import 'package:e_learning_app/features/my_courses/presentation/states/mobx/update_course_store.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../../../bases/presentation/atoms/default_result_dialog.dart';
import '../../../../../configs/colors.dart';
import '../../../../../configs/dimens.dart';
import '../../../../../core/app/loading.dart';
import '../../../../../generated/translations/locale_keys.g.dart';
import '../../../../settings/presentation/widgets/setting_app_bar.dart';
import '../../states/provider/update_course_provider.dart';
import 'update_course_information.dart';

class UpdateCoursePage extends StatelessWidget {
  const UpdateCoursePage({
    super.key,
    required this.courseId,
  });

  final String courseId;

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      const Tab(text: "Course Information"),
      const Tab(text: "Update Sections"),
    ];
    final store = context.read<UpdateCourseStore>();
    final provider = context.read<UpdateCourseProvider>();

    return Observer(
      builder: (_) {
        if (store.state == BaseSate.init) {
          store.getCourseDetail(courseId);
        }

        if (store.state == BaseSate.loading) {
          return const Scaffold(
            appBar: SettingAppBar(title: "Update Course"),
            body: Center(
              child: LoadingWidget(),
            ),
          );
        }

        if (store.state == BaseSate.error) {
          return Scaffold(
            appBar: const SettingAppBar(title: "Update Course"),
            body: Center(
              child: Text(store.errorMessage ?? "Unexpected Error!!"),
            ),
          );
        }

        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            provider.course = store.courseDetail!;
          },
        );

        // Trigger update UI
        if (store.updateState == BaseSate.loading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AppLoading.showLoadingDialog(context);
          });
        }
        if (store.updateState == BaseSate.error || store.errorMessage != null) {
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
        } else if (store.updateState == BaseSate.loaded) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              AppLoading.dismissLoadingDialog(context);
            },
          );
        }

        return DefaultTabController(
          length: tabs.length,
          child: Scaffold(
            appBar: SettingAppBar(
              title: "Update Course",
              bottom: TabBar(
                tabs: tabs,
                labelColor: AppColors.primaryColor,
                indicator: MaterialIndicator(
                  tabPosition: TabPosition.bottom,
                  color: AppColors.primaryColor,
                  strokeWidth: 1,
                  horizontalPadding: AppDimens.extraLargeWidthDimens,
                  paintingStyle: PaintingStyle.fill,
                ),
              ),
            ),
            body: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                UpdateCourseInformation(
                  onCourseInformationSaved: () {
                    log("Saved: ${provider.course} - ${provider.isUpdateImage}");
                    store.updateCourseInformation(
                      provider.course,
                      provider.isUpdateImage,
                    );
                  },
                ),
                const UpdateCourseSectionPage(),
              ],
            ),
          ),
        );
      },
    );
  }
}
