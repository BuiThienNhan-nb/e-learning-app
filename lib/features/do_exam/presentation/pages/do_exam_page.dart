import 'package:e_learning_app/bases/mobx/base_state.dart';
import 'package:e_learning_app/bases/presentation/atoms/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../../bases/presentation/atoms/default_result_dialog.dart';
import '../../../../bases/presentation/atoms/text_button.dart';
import '../../../../configs/dimens.dart';
import '../../../settings/presentation/widgets/setting_app_bar.dart';
import '../state/do_exam_provider.dart';
import '../state/do_exam_store.dart';
import '../widgets/do_exam_clock_widget.dart';
import '../widgets/do_question_item.dart';

class DoExamPage extends StatelessWidget {
  const DoExamPage({
    super.key,
    required this.examId,
  });

  final String examId;

  @override
  Widget build(BuildContext context) {
    // final exam = GetIt.I<MockExam>().exam;
    final store = context.read<DoExamStore>();

    return Observer(
      builder: (_) {
        if (store.getState == BaseSate.init) {
          store.getExam(examId);
        }

        return store.getState == BaseSate.loaded
            ? Consumer<DoExamProvider>(
                builder: (_, provider, __) => Scaffold(
                  appBar: SettingAppBar(
                    title: store.exam!.examTitle,
                  ),
                  body: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: AppDimens.largeHeightDimens),
                        DoExamOClockWidget(
                          minutes: store.exam!.time,
                          timeOutCallback: () {
                            provider.isDone = true;
                            store.exam!.questions
                                .asMap()
                                .forEach((index, value) {
                              if (provider.answers[index] == null) {
                                return;
                              }
                              if (store.exam!.questions[index].answer
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
                          itemCount: store.exam!.questions.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => DoQuestionItem(
                            question: store.exam!.questions[index],
                            questionIndex: index,
                          ),
                        ),
                        DefaultTextButton(
                          submit: () {
                            provider.isDone = true;
                            store.exam!.questions
                                .asMap()
                                .forEach((index, value) {
                              if (provider.answers[index] == null) {
                                return;
                              }
                              if (store.exam!.questions[index].answer
                                      .compareTo(provider.answers[index]!) ==
                                  0) {
                                provider.score++;
                              }
                            });
                            showDialog(
                              context: context,
                              builder: (_) => DefaultResultDialog(
                                content:
                                    "Congratulations! You have finished your exam, good job! Your Score is: ${provider.score}/${store.exam!.questions.length}",
                                isError: false,
                              ),
                            );
                          },
                        ),
                        SizedBox(height: AppDimens.largeHeightDimens),
                      ],
                    ),
                  ),
                ),
              )
            : Scaffold(
                body: Center(
                  child: store.getState == BaseSate.loading
                      ? const LoadingWidget()
                      : Text(store.errorMessage ?? "Unexpected error!"),
                ),
              );
      },
    );
  }
}
