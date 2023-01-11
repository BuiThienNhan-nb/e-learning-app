import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/styles.dart';
import '../../../settings/presentation/widgets/setting_app_bar.dart';
import '../states/create_exam_provider.dart';
import '../widgets/create_exam_dialog.dart';
import '../widgets/question_item.dart';

class CreateExamPage extends StatelessWidget {
  const CreateExamPage({
    super.key,
    required this.lessonTitle,
  });

  final String lessonTitle;

  @override
  Widget build(BuildContext context) {
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

    return Consumer<CreateExamProvider>(
      builder: (_, provider, __) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: SettingAppBar(title: lessonTitle),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                // Add exam
                provider.addQuestion();
                openDialog(provider.exam.questions.length - 1, provider);
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
              },
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.whiteColor,
              child: const Icon(Icons.save),
            ),
          ],
        ),
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
                SizedBox(
                  width: AppDimens.extraLargeWidthDimens * 4,
                  child: TextField(
                    controller: timeController,
                    decoration: const InputDecoration(hintText: "Time limit"),
                    onSubmitted: (value) => timeController.text = value.trim(),
                  ),
                ),
                SizedBox(height: AppDimens.mediumHeightDimens),
                ListView.builder(
                  itemCount: provider.exam.questions.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => QuestionItemWidget(
                    question: provider.exam.questions[index],
                    editCallback: () => openDialog(index, provider),
                    deleteCallback: () => provider.deleteQuestion(index),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
