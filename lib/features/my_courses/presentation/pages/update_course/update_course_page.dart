import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../../../bases/mobx/base_state.dart';
import '../../../../../bases/presentation/atoms/default_result_dialog.dart';
import '../../../../../bases/presentation/atoms/loading_dialog.dart';
import '../../../../../configs/colors.dart';
import '../../../../../configs/dimens.dart';
import '../../../../../core/app/loading.dart';
import '../../../../../generated/translations/locale_keys.g.dart';
import '../../../../home/domain/entities/lesson_model.dart';
import '../../../../home/domain/entities/section_model.dart';
import '../../../../settings/presentation/widgets/setting_app_bar.dart';
import '../../states/mobx/update_course_store.dart';
import '../../states/provider/update_course_provider.dart';
import 'update_course_information.dart';
import 'update_section/update_course_section_page.dart';

class UpdateCoursePage extends StatelessWidget {
  UpdateCoursePage({
    super.key,
    required this.courseId,
  });

  String courseId;

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
            courseId = provider.course.id;
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

        // Trigger update UI
        if (store.createSectionState == BaseSate.loading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AppLoading.showLoadingDialog(context);
          });
        }
        if (store.createSectionState == BaseSate.error ||
            store.errorMessage != null) {
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
        } else if (store.createSectionState == BaseSate.loaded) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              AppLoading.dismissLoadingDialog(context);
              provider.addSection(store.section!);
              store.reInitCreateSection();
            },
          );
        }

        // Trigger update UI
        if (store.deleteSectionState == BaseSate.loading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AppLoading.showLoadingDialog(context);
          });
        }
        if (store.deleteSectionState == BaseSate.error ||
            store.errorMessage != null) {
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
        } else if (store.deleteSectionState == BaseSate.loaded) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              AppLoading.dismissLoadingDialog(context);
              provider.deleteSectionAtIndex(store.sectionIndex!);
              store.reInitDeleteSection();
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
                UpdateCourseSectionPage(
                  createSection: () => store.createSection(
                    SectionModel(
                      id: "id_section",
                      title: "",
                      lessons: List<LessonModel>.from([]),
                      order: provider.course.section.length + 1,
                    ),
                    courseId,
                  ),
                  deleteSection: (sectionId, index) =>
                      store.deleteSection(sectionId, courseId, index),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
