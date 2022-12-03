import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/styles.dart';
import '../../../home/domain/entities/lesson_model.dart';
import '../../../home/domain/entities/section_model.dart';

class CourseSectionWidget extends StatelessWidget {
  const CourseSectionWidget({
    super.key,
    required this.section,
    required this.index,
  });

  final SectionModel section;
  final int index;

  @override
  Widget build(BuildContext context) {
    int totalSectionMins = 0;
    for (var lesson in section.lessons) {
      totalSectionMins += lesson.length ?? 0;
    }
    final TextStyle textStyle = AppStyles.headline6TextStyle.copyWith(
      fontWeight: FontWeight.w900,
      color: AppColors.neutral.shade700,
    );
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
        child: ExpansionTile(
          initiallyExpanded: true,
          trailing: Text(
            "$totalSectionMins mins",
            style: textStyle.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          title: Text(
            "Section $index - ${section.title}",
            style: textStyle,
          ),
          children: [
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
          ],
        ),
      ),
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
        margin: EdgeInsets.all(AppDimens.mediumWidthDimens),
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
              color: AppColors.secondaryColor.withOpacity(0.3),
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
                    lesson.videoUrl == null
                        ? "0 mins"
                        : "${lesson.length} mins",
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
