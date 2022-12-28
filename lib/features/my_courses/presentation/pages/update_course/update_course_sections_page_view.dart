import 'package:e_learning_app/features/my_courses/presentation/pages/update_course/update_lesson_content.dart';
import 'package:e_learning_app/features/my_courses/presentation/pages/update_course/update_sections_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../configs/colors.dart';
import '../../../../../configs/dimens.dart';
import '../../states/provider/update_course_provider.dart';

class UpdateCourseSectionsPageView extends StatelessWidget {
  const UpdateCourseSectionsPageView({
    super.key,
    // required this.provider,
  });

  // final UpdateCourseProvider provider;

  @override
  Widget build(BuildContext context) {
    final List<Widget> contents = [
      const UpdateSectionsContent(),
      const UpdateLessonContent(),
    ];
    // final provider = context.read<UpdateCourseProvider>();
    final PageController controller = PageController(
        initialPage: context.read<UpdateCourseProvider>().stepIndex);

    return Consumer<UpdateCourseProvider>(
      builder: (_, provider, __) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: PageView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          children: contents,
        ),
        floatingActionButton: provider.stepIndex == 0
            ? FloatingActionButton(
                onPressed: () {
                  if (provider.stepIndex < contents.length - 1) {
                    provider.stepIndex++;
                    controller.animateToPage(
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
                        controller.animateToPage(
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
                  FloatingActionButton(
                    onPressed: () {
                      // TODO: Update Section
                    },
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.whiteColor,
                    child: Padding(
                      padding: EdgeInsets.all(AppDimens.largeWidthDimens),
                      child: const Icon(
                        Icons.save_rounded,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
