import 'package:e_learning_app/configs/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../configs/colors.dart';
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
            lesson.videoUrl == null
                ? Container(
                    color: AppColors.neutral.shade900,
                    height: 0.25.sh,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "This lesson doesn't contain a video!",
                        style: AppStyles.headline6TextStyle.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  )
                : VideoPlayerWidget(videoUrl: lesson.videoUrl!),
            Expanded(
              child: LayoutBuilder(
                builder: (p0, p1) => LessonCommentWidget(
                  lessonId: lessonId,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: "Do Exam",
          foregroundColor: AppColors.whiteColor,
          backgroundColor: AppColors.primaryColor,
          onPressed: () => GoRouter.of(context).pushNamed(
            "do_exam",
            params: {
              "lessonId": lessonId,
              "examId": lessonId,
            },
          ),
          child: const Icon(Icons.document_scanner),
        ),
      ),
    );
  }
}
