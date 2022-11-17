import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/configs/dimens.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:e_learning_app/features/home/domain/entities/lesson_model.dart';
import 'package:e_learning_app/features/home/domain/entities/section_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CourseSectionWidget extends StatelessWidget {
  const CourseSectionWidget({
    super.key,
    required this.section,
  });

  final SectionModel section;

  @override
  Widget build(BuildContext context) {
    int totalSectionMins = 0;
    for (var lesson in section.lessons) {
      totalSectionMins += lesson.video!.length;
    }
    final TextStyle textStyle = AppStyles.headline6TextStyle.copyWith(
      fontWeight: FontWeight.w900,
      color: AppColors.neutral.shade700,
    );
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  section.title,
                  style: textStyle,
                ),
              ),
              SizedBox(width: AppDimens.mediumWidthDimens),
              Text(
                "$totalSectionMins mins",
                style: textStyle.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          itemCount: section.lessons.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(
              top: AppDimens.mediumHeightDimens,
              bottom: AppDimens.mediumHeightDimens,
            ),
            child: LessonBuildItem(
              lesson: section.lessons[index],
            ),
          ),
        ),
        SizedBox(height: AppDimens.extraLargeHeightDimens),
      ],
    );
  }
}

class LessonBuildItem extends StatelessWidget {
  const LessonBuildItem({
    super.key,
    required this.lesson,
  });

  final LessonModel lesson;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).pushNamed(
        "lesson_detail",
        params: {
          'lessonId': lesson.id,
        },
        extra: lesson,
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: AppDimens.largeHeightDimens,
          bottom: AppDimens.largeHeightDimens,
        ),
        decoration: BoxDecoration(
          // color: AppColors.neutral.shade100,
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(AppDimens.itemRadius),
          boxShadow: [
            BoxShadow(
              color: AppColors.secondaryColor.withOpacity(0.2),
              blurRadius: AppDimens.mediumHeightDimens,
              // offset: const Offset(1, 1),
              blurStyle: BlurStyle.normal,
              spreadRadius: 0.2,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: AppDimens.mediumWidthDimens),
            Container(
              // width: AppDimens.extraLargeWidthDimens * 3,
              padding: EdgeInsets.all(AppDimens.mediumWidthDimens),
              decoration: const BoxDecoration(
                color: AppColors.lightSecondaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  "${lesson.order}",
                  style: AppStyles.subtitle1TextStyle.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            SizedBox(width: AppDimens.mediumWidthDimens),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    lesson.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.subtitle1TextStyle.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    lesson.video == null
                        ? "0 mins"
                        : "${lesson.video!.length} mins",
                    style: AppStyles.subtitle2TextStyle.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppDimens.mediumWidthDimens),
            Image.asset(
              "assets/icons/play_button_icon.png",
              color: AppColors.primaryColor,
            ),
            SizedBox(width: AppDimens.mediumWidthDimens),
          ],
        ),
      ),
    );
  }
}
