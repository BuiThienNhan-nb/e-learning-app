import 'package:flutter/material.dart';

import '../../../../bases/presentation/atoms/hor_lesson_card.dart';
import '../../../../configs/dimens.dart';

class ContinueLessonListView extends StatelessWidget {
  const ContinueLessonListView({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.only(
          left: AppDimens.largeWidthDimens,
          right: AppDimens.largeWidthDimens,
        ),
        itemBuilder: (_, index) => ContinueLessonCard(
          leftPadding: index != 0 ? AppDimens.mediumWidthDimens : null,
          height: AppDimens.extraLargeHeightDimens * 6,
        ),
      ),
    );
  }
}
