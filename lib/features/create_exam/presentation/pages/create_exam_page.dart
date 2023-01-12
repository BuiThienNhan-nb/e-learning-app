import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../bases/presentation/atoms/default_result_dialog.dart';
import '../../../../bases/presentation/atoms/loading_dialog.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/styles.dart';
import '../../../../core/app/loading.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../../settings/presentation/widgets/setting_app_bar.dart';
import '../states/create_exam_provider.dart';
import '../states/create_exam_store.dart';
import '../widgets/create_exam_dialog.dart';
import '../widgets/question_item.dart';

class CreateExamPage extends StatelessWidget {
  const CreateExamPage({
    super.key,
    required this.lessonId,
    required this.lessonTitle,
  });

  final String lessonId;
  final String lessonTitle;

  @override
  Widget build(BuildContext context) {
    final store = context.read<CreateExamStore>();
    final TextEditingController timeController = TextEditingController();

    void openDialog(int questionIndex, CreateExamProvider provider) {
      provider.updateQuestionValues(questionIndex);
      showDialog(
        context: context,
        useSafeArea: true,
        barrierDismissible: false,
        builder: (context) => ChangeNotifierProvider.value(
          value: provider,
          child: CreateExamDialog(
            onSubmitQuestion: () {},
            questionTitle: provider.exam.questions[questionIndex].title,
            questionIndex: questionIndex,
          ),
        ),
      );
    }

    return Observer(
      builder: (_) {
        if (store.getState == BaseSate.init) {
          store.getExam(lessonId, lessonTitle);
        }
        if (store.getState == BaseSate.loaded) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            timeController.text = store.exam!.time.toString();
            context.read<CreateExamProvider>().exam = store.exam!;
          });
        }

        // Trigger UI
        if (store.createState == BaseSate.loading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AppLoading.showLoadingDialog(context);
          });
        }
        if (store.createState == BaseSate.error || store.errorMessage != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AppLoading.dismissLoadingDialog(context);
            showDialog(
              context: context,
              builder: (_) => DefaultResultDialog(
                content:
                    store.errorMessage ?? LocaleKeys.serverUnexpectedError.tr(),
                isError: true,
              ),
            );
          });
        } else if (store.createState == BaseSate.loaded) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              AppLoading.dismissLoadingDialog(context);
              store.reInitCreateState();
              // showDialog(
              //   context: context,
              //   builder: (_) => const DefaultResultDialog(
              //     content: "Create Exam Successfully!",
              //     isError: false,
              //   ),
              // );
              GoRouter.of(context).pop();
            },
          );
        }

        return store.getState == BaseSate.loaded
            ? Consumer<CreateExamProvider>(
                builder: (_, provider, __) => Scaffold(
                  resizeToAvoidBottomInset: false,
                  appBar: SettingAppBar(title: lessonTitle),
                  floatingActionButton: store.canCreate
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                                // Add exam
                                provider.addQuestion();
                                openDialog(provider.exam.questions.length - 1,
                                    provider);
                              },
                              backgroundColor: AppColors.primaryColor,
                              foregroundColor: AppColors.whiteColor,
                              child: const Icon(Icons.add),
                            ),
                            SizedBox(width: AppDimens.mediumWidthDimens),
                            FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                                // Save exam
                                provider.exam.time =
                                    int.parse(timeController.text.trim());
                                store.createExam(provider.exam);
                              },
                              backgroundColor: AppColors.primaryColor,
                              foregroundColor: AppColors.whiteColor,
                              child: const Icon(Icons.save),
                            ),
                          ],
                        )
                      : null,
                  body: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: AppDimens.largeHeightDimens),
                          Text(
                            "Exam: $lessonTitle exam",
                            style: AppStyles.headline5TextStyle.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: AppDimens.smallHeightDimens),
                          store.canCreate
                              ? SizedBox(
                                  width: AppDimens.extraLargeWidthDimens * 4,
                                  child: TextField(
                                    controller: timeController,
                                    decoration: const InputDecoration(
                                        hintText: "Time limit"),
                                    onSubmitted: (value) =>
                                        timeController.text = value.trim(),
                                    keyboardType: TextInputType.number,
                                  ))
                              : Text(
                                  "Time: ${timeController.text.trim()}",
                                  style: AppStyles.headline6TextStyle,
                                ),
                          SizedBox(height: AppDimens.mediumHeightDimens),
                          ListView.builder(
                            itemCount: provider.exam.questions.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (_, index) => QuestionItemWidget(
                              // question: provider.exam.questions[index],
                              questionIndex: index,
                              editCallback: () => openDialog(index, provider),
                              deleteCallback: () =>
                                  provider.deleteQuestion(index),
                              canCreate: store.canCreate,
                            ),
                          ),
                        ],
                      ),
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
