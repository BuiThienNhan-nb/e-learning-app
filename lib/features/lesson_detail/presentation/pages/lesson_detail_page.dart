import 'package:e_learning_app/configs/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../../configs/colors.dart';
import '../../../do_exam/presentation/pages/do_exam_page.dart';
import '../../../do_exam/presentation/state/do_exam_provider.dart';
import '../../../do_exam/presentation/state/do_exam_store.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(" ${lesson.title}"),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.iconLightBasic),
        actionsIconTheme: const IconThemeData(color: AppColors.iconLightBasic),
        titleTextStyle: Theme.of(context).textTheme.displayMedium,
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
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => MultiProvider(
              providers: [
                ChangeNotifierProvider<DoExamProvider>(
                  create: (_) => GetIt.I(),
                  lazy: true,
                ),
                Provider<DoExamStore>(
                  create: (_) => GetIt.I(),
                  lazy: true,
                ),
              ],
              child: DoExamPage(
                examId: lessonId,
              ),
            ),
          ),
        ),
        child: const Icon(Icons.document_scanner),
      ),
    );
  }
}
