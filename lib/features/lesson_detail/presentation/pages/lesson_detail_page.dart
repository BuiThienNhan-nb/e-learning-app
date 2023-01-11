import 'package:e_learning_app/configs/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../../configs/colors.dart';
import '../../../../configs/env.dart';
import '../../../../core/app/provider.dart';
import '../../../home/domain/entities/lesson_model.dart';
import '../../../settings/presentation/pages/settings_page.dart';
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

  void pushDoExamBrowser() {
    final url =
        "${Env.instance.doExamUrl}/?userId=${GetIt.I<AppProvider>().user.id}&lessonId=$lessonId";
    final MyInAppBrowser browser = MyInAppBrowser();

    final settings = InAppBrowserClassOptions(
      crossPlatform: InAppBrowserOptions(hideUrlBar: false),
      inAppWebViewGroupOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(javaScriptEnabled: true),
      ),
    );

    browser.openUrlRequest(
      urlRequest: URLRequest(
        url: Uri.parse(url),
      ),
      options: settings,
    );
  }

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
                    child: Text(
                      "This lesson doesn't contain a video!",
                      style: AppStyles.subtitle1TextStyle,
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
          onPressed: pushDoExamBrowser,
          child: const Icon(Icons.document_scanner),
        ),
      ),
    );
  }
}
