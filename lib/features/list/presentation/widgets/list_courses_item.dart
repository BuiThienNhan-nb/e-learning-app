import 'dart:math';

import 'package:e_learning_app/bases/presentation/atoms/w_image_network.dart';
import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/configs/dimens.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';
import 'package:e_learning_app/features/top/presentation/widgets/w_label_container.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ListCoursesItem extends StatelessWidget {
  const ListCoursesItem({
    super.key,
    required this.course,
    required this.onCourseTap,
    this.isEnrolled,
  });

  final CourseModel course;
  final Function(CourseModel) onCourseTap;
  final bool? isEnrolled;

  @override
  Widget build(BuildContext context) {
    final progress = Random().nextDouble();

    List<Widget> buildLabels() {
      List<Widget> list = [];

      for (int i = 0; i < course.categories.length; i++) {
        if (i == 2) break;
        list.addAll([
          WLabelContainer(
            color: course.categories[i].color,
            title: course.categories[i].title,
          ),
          const SizedBox(width: 3)
        ]);
      }

      return list;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () => onCourseTap(course),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 20),
            WImageNetwork(
              imageUrl: course.image ?? 'null',
              width: 160,
              height: 90,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    course.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    course.description,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.textGray999),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.star_rate_rounded,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      Container(
                        // color: Colors.red,
                        child: Text(
                          '${course.rates.toStringAsFixed(2)} (${course.votes})',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.textGray999,
                                    height: 18 / 12,
                                  ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  WLabelContainer(
                    color: AppColors.labelBasicLiveMode,
                    title: course.category.first,
                  ),
                ],
              ),
            ),
            isEnrolled == null
                ? const SizedBox(width: 15)
                : Container(
                    height: 90,
                    alignment: Alignment.center,
                    child: CircularPercentIndicator(
                      radius: AppDimens.extraLargeWidthDimens * 1,
                      percent: progress,
                      lineWidth: 6,
                      animation: true,
                      animationDuration: 1200,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: progress >= 0.6
                          ? AppColors.labelSimultaneousProgram
                          : progress >= 0.4
                              ? Colors.yellowAccent
                              : AppColors.accentImportant,
                      center: Text(
                        "${(progress * 100).toStringAsFixed(1)}%",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                    ),
                  ),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
