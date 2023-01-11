import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../../bases/presentation/atoms/default_result_dialog.dart';
import '../../../../bases/presentation/atoms/text_button.dart';
import '../../../../configs/dimens.dart';
import '../../../../utils/mock/mocl_exam.dart';
import '../../../settings/presentation/widgets/setting_app_bar.dart';
import '../state/do_exam_provider.dart';
import '../widgets/do_exam_clock_widget.dart';
import '../widgets/do_question_item.dart';

class DoExamPage extends StatelessWidget {
  const DoExamPage({
    super.key,
    required this.lessonId,
  });

  final String lessonId;

  @override
  Widget build(BuildContext context) {
    final exam = GetIt.I<MockExam>().exam;
    return Consumer<DoExamProvider>(
      builder: (_, provider, __) => Scaffold(
        appBar: SettingAppBar(
          title: exam.examTitle,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: AppDimens.largeHeightDimens),
              DoExamOClockWidget(
                minutes: exam.time,
                timeOutCallback: () {
                  provider.isDone = true;
                  exam.questions.asMap().forEach((index, value) {
                    if (provider.answers[index] == null) {
                      return;
                    }
                    if (exam.questions[index].answer
                            .compareTo(provider.answers[index]!) ==
                        0) {
                      provider.score++;
                    }
                  });
                  showDialog(
                    context: context,
                    builder: (_) => DefaultResultDialog(
                      content:
                          "Your time is over! Application will submit the current state of the exam for you! Your Score is: ${provider.score}",
                      isError: true,
                    ),
                  );
                },
              ),
              SizedBox(height: AppDimens.largeHeightDimens),
              ListView.builder(
                itemCount: exam.questions.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => DoQuestionItem(
                  question: exam.questions[index],
                  questionIndex: index,
                ),
              ),
              DefaultTextButton(
                submit: () {
                  provider.isDone = true;
                  exam.questions.asMap().forEach((index, value) {
                    if (provider.answers[index] == null) {
                      return;
                    }
                    if (exam.questions[index].answer
                            .compareTo(provider.answers[index]!) ==
                        0) {
                      provider.score++;
                    }
                  });
                  showDialog(
                    context: context,
                    builder: (_) => DefaultResultDialog(
                      content:
                          "Congratulations! You have finished your exam, good job! Your Score is: ${provider.score}",
                      isError: false,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
