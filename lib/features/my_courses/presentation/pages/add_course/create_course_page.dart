import 'dart:developer';

import 'package:e_learning_app/features/home/domain/entities/course_model.dart';
import 'package:e_learning_app/features/my_courses/presentation/states/mobx/create_course_store.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../bases/mobx/base_state.dart';
import '../../../../../bases/presentation/atoms/default_result_dialog.dart';
import '../../../../../configs/colors.dart';
import '../../../../../configs/dimens.dart';
import '../../../../../configs/styles.dart';
import '../../../../../core/app/loading.dart';
import '../../../../../generated/translations/locale_keys.g.dart';
import '../../../../settings/presentation/widgets/setting_app_bar.dart';
import '../../states/provider/create_course_provider.dart';
import 'add_general_information_content.dart';
import 'add_section_content.dart';
import 'add_lesson_content.dart';

class CreateCoursePage extends StatelessWidget {
  const CreateCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    final createProvider = GetIt.I<CreateCourseProvider>();
    final store = GetIt.I<CreateCourseStore>();

    final titleTextStyle = AppStyles.subtitle1TextStyle.copyWith(
      fontWeight: FontWeight.w900,
    );
    final processes = [
      "General Information",
      "Add Sections",
      "Add Lesson",
    ];

    final List<Widget> contents = [
      AddGeneralInformationContent(provider: createProvider),
      AddSectionContent(provider: createProvider),
      AddLessonContent(provider: createProvider),
    ];

    return Observer(
      builder: (_) {
        if (store.state == BaseSate.loading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AppLoading.showLoadingDialog(context);
          });
        }
        if (store.state == BaseSate.error || store.errorMessage != null) {
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
        } else if (store.state == BaseSate.loaded) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              AppLoading.dismissLoadingDialog(context);
              createProvider.dispose();
              GoRouter.of(context).pop();
            },
          );
        }

        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: SettingAppBar(title: processes[store.stepIndex]),
          body: PageView(
            controller: store.controller,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            children: contents,
          ),
          floatingActionButton: store.stepIndex == 0
              ? FloatingActionButton(
                  onPressed: () {
                    if (store.stepIndex < contents.length - 1) {
                      store.stepIndex++;
                      store.controller.animateToPage(
                        store.stepIndex,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.whiteColor,
                  child: SvgPicture.asset(
                    "assets/icons/arrow_right_icon.svg",
                    color: AppColors.whiteColor,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      heroTag: null,
                      onPressed: () {
                        if (store.stepIndex > 0) {
                          store.stepIndex--;
                          store.controller.animateToPage(
                            store.stepIndex,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.whiteColor,
                      child: SvgPicture.asset(
                        "assets/icons/arrow_left_icon.svg",
                        color: AppColors.whiteColor,
                      ),
                    ),
                    SizedBox(width: AppDimens.mediumWidthDimens),
                    store.stepIndex < processes.length - 1
                        ? FloatingActionButton(
                            heroTag: null,
                            onPressed: () {
                              if (store.stepIndex < contents.length - 1) {
                                store.stepIndex++;
                                store.controller.animateToPage(
                                  store.stepIndex,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: AppColors.whiteColor,
                            child: SvgPicture.asset(
                              "assets/icons/arrow_right_icon.svg",
                              color: AppColors.whiteColor,
                            ),
                          )
                        : FloatingActionButton(
                            onPressed: () {
                              // log(createProvider.title.text.trim());
                              log(createProvider.sections.toString());
                              store.createCourse(
                                CourseModel(
                                  id: "id",
                                  title: createProvider.title.text.trim(),
                                  description:
                                      createProvider.description.text.trim(),
                                  rates: 0,
                                  votes: 0,
                                  image: createProvider.imageSource,
                                  category: [
                                    createProvider.category.text.trim(),
                                  ],
                                  price: 0,
                                  section: createProvider.sections,
                                  haveCertificate: true,
                                ),
                              );
                            },
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: AppColors.whiteColor,
                            child: Padding(
                              padding:
                                  EdgeInsets.all(AppDimens.largeWidthDimens),
                              child: SvgPicture.asset(
                                "assets/icons/done_check_icon.svg",
                                color: AppColors.whiteColor,
                                fit: BoxFit.scaleDown,
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

class ControlBuilderItem extends StatelessWidget {
  const ControlBuilderItem({
    super.key,
    required this.iconSource,
    required this.onTap,
  });

  final Function()? onTap;
  final String iconSource;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimens.smallWidthDimens),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        shape: BoxShape.circle,
      ),
      child: InkWell(
        onTap: onTap,
        child: SvgPicture.asset(
          iconSource,
          fit: BoxFit.scaleDown,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
