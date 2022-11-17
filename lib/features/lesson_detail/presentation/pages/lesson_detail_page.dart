import 'package:flutter/material.dart';

import '../../../home/domain/entities/lesson_model.dart';
import '../widgets/lesson_comment_widget.dart';
import '../widgets/video_player_widget.dart';

class LessonDetailPage extends StatelessWidget {
  const LessonDetailPage({
    super.key,
    required this.lesson,
    required this.lessonId,
  });

  final LessonModel lesson;
  final String lessonId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(" ${lesson.title}"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            VideoPlayerWidget(videoUrl: lesson.video?.videoUrl ?? ""),
            Expanded(
              child: LayoutBuilder(
                builder: (p0, p1) => const LessonCommentWidget(),
              ),
            ),
            // Expanded(
            //   child: LayoutBuilder(
            //     builder: (context, constraint) => Expanded(
            //       child: ListView.builder(
            //         itemCount: 15,
            //         physics: const BouncingScrollPhysics(),
            //         shrinkWrap: true,
            //         scrollDirection: Axis.vertical,
            //         itemBuilder: (context, index) => SizedBox(
            //           height: AppDimens.extraLargeHeightDimens * 4,
            //           child: Center(
            //             child: Text(index.toString()),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
