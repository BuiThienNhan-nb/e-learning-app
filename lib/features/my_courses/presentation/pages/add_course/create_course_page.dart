import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../../../configs/colors.dart';
import '../../../../../configs/dimens.dart';
import '../../../../../configs/styles.dart';
import '../../../../settings/presentation/widgets/setting_app_bar.dart';
import '../../states/provider/create_course_provider.dart';
import '../../states/provider/my_courses_provider.dart';
import 'add_general_information_content.dart';
import 'add_section_content.dart';
import 'add_lesson_content.dart';

class CreateCoursePage extends StatelessWidget {
  const CreateCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    final createProvider = GetIt.I<CreateCourseProvider>();

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

    return Consumer<MyCoursesProvider>(
      builder: (_, provider, ___) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: SettingAppBar(title: processes[provider.stepIndex]),
        body: PageView(
          controller: provider.controller,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          children: contents,
        ),
        floatingActionButton: provider.stepIndex == 0
            ? FloatingActionButton(
                onPressed: () {
                  if (provider.stepIndex < contents.length - 1) {
                    provider.stepIndex++;
                    provider.controller.animateToPage(
                      provider.stepIndex,
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
                      if (provider.stepIndex > 0) {
                        provider.stepIndex--;
                        provider.controller.animateToPage(
                          provider.stepIndex,
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
                  provider.stepIndex < processes.length - 1
                      ? FloatingActionButton(
                          heroTag: null,
                          onPressed: () {
                            if (provider.stepIndex < contents.length - 1) {
                              provider.stepIndex++;
                              provider.controller.animateToPage(
                                provider.stepIndex,
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
                            log(createProvider.title.text.trim());
                            log(createProvider.sections.toString());
                          },
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: AppColors.whiteColor,
                          child: Padding(
                            padding: EdgeInsets.all(AppDimens.largeWidthDimens),
                            child: SvgPicture.asset(
                              "assets/icons/done_check_icon.svg",
                              color: AppColors.whiteColor,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                ],
              ),
      ),
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
