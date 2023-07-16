import 'package:e_learning_app/features/lesson_detail/presentation/pages/lesson_detail_page.dart';
import 'package:e_learning_app/features/lesson_detail/presentation/states/mobx/lesson_comments_store.dart';
import 'package:e_learning_app/features/lesson_detail/presentation/states/provider/lesson_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/styles.dart';
import '../../../home/domain/entities/lesson_model.dart';
import '../../../home/domain/entities/section_model.dart';

class CourseSectionWidget extends StatelessWidget {
  const CourseSectionWidget({
    super.key,
    required this.section,
    // required this.index,
    required this.courseId,
  });

  final SectionModel section;
  // final int index;
  final String courseId;

  @override
  Widget build(BuildContext context) {
    int totalSectionMins = 0;
    for (var lesson in section.lessons) {
      totalSectionMins += lesson.length ?? 0;
    }
    final TextStyle? textStyle =
        Theme.of(context).textTheme.headlineMedium?.copyWith(
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
            style: textStyle?.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          title: Text(
            "Section ${section.order} - ${section.title}",
            style: textStyle,
          ),
          children: [
            ListView.builder(
              itemCount: section.lessons.length,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(
                  // top: AppDimens.mediumHeightDimens,
                  bottom: AppDimens.mediumHeightDimens,
                ),
                child: LessonBuildItem(
                  lesson: section.lessons[index],
                  courseId: courseId,
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
    required this.courseId,
  });

  final LessonModel lesson;
  final String courseId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider<LessonDetailPageProvider>(
                create: (_) => GetIt.I<LessonDetailPageProvider>(),
                lazy: true,
              ),
              Provider<LessonCommentsStore>(
                create: (_) => GetIt.I(),
                lazy: true,
              ),
            ],
            child: LessonDetailPage(
              lesson: lesson,
              lessonId: lesson.id,
            ),
          ),
        ),
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
