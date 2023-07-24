import 'package:e_learning_app/features/create_exam/domain/entities/question_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../bases/presentation/atoms/text_button.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/styles.dart';
import '../states/create_exam_provider.dart';

class CreateExamDialog extends StatelessWidget {
  CreateExamDialog({
    super.key,
    required this.onSubmitQuestion,
    required this.questionTitle,
    // required this.questionIndex,
    required this.question,
  });

  final Function() onSubmitQuestion;
  final String questionTitle;
  // final int questionIndex;
  final QuestionModel question;
  late final titleController = TextEditingController(
    text: questionTitle,
  );

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CreateExamProvider>();

    return AlertDialog(
      actionsAlignment: MainAxisAlignment.start,
      actionsOverflowButtonSpacing: AppDimens.smallHeightDimens,
      actionsOverflowDirection: VerticalDirection.up,
      scrollable: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDimens.itemRadius,
        ),
      ),
      actionsPadding:
          EdgeInsets.symmetric(horizontal: AppDimens.extraLargeWidthDimens),
      title: Text(
        "Add question",
        style: AppStyles.headline6TextStyle.copyWith(
          color: AppColors.primaryColor,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        SizedBox(height: AppDimens.smallHeightDimens),
        DefaultTextButton(
          submit: () {
            provider.updateQuestionTitle(question, titleController.text.trim());
            Navigator.of(context).pop();
          },
          title: "Close",
          backgroundColor: AppColors.primaryColor.withOpacity(0.1),
          titleStyle: AppStyles.headline6TextStyle.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ],
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: "Question Title",
              ),
              onSubmitted: (value) => titleController.text = value.trim(),
            ),
            Selector<CreateExamProvider, int>(
              selector: (_, provider) => provider.numberOfOptions,
              builder: (_, optionsLength, __) => TextField(
                readOnly: true,
                controller: TextEditingController(
                  text: provider.numberOfOptions.toString(),
                ),
                decoration: InputDecoration(
                  label: const Text("Number of options"),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          provider.removeOption(
                              provider.exam.questions.indexOf(question));
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      IconButton(
                        onPressed: () {
                          provider.addOption(
                              provider.exam.questions.indexOf(question));
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "List of options",
                style: AppStyles.subtitle1TextStyle,
              ),
            ),
            Selector<CreateExamProvider, int>(
              selector: (_, provider) => provider.numberOfOptions,
              builder: (_, optionsLength, __) => SizedBox(
                height: AppDimens.extraLargeHeightDimens * 5,
                width: double.maxFinite,
                child: ListView.builder(
                  itemCount: optionsLength,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final isAnswer =
                        question.options[index].compareTo(provider.answer) == 0;

                    return TextField(
                      controller: TextEditingController(
                        text: question.options[index],
                      ),
                      decoration: InputDecoration(
                        hintText: "Option ${index + 1}",
                      ),
                      onChanged: (value) {
                        question.options[index] = value.trim();
                        if (isAnswer) {
                          provider.answer = value.trim();
                        }
                        provider.trigger();
                      },
                      onSubmitted: (value) {
                        question.options[index] = value.trim();
                        // provider.answer = question.answer;
                        if (isAnswer) {
                          provider.answer = value.trim();
                        }
                        provider.trigger();
                      },
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Answer",
                style: AppStyles.subtitle1TextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Selector<CreateExamProvider, double>(
              selector: (_, provider) => provider.triggerNum,
              builder: (_, __, ___) => Selector<CreateExamProvider, String>(
                  selector: (_, provider) => provider.answer,
                  builder: (_, answer, __) {
                    return DropdownButton<int>(
                      value: question.options.indexWhere(
                          (element) => element.compareTo(answer) == 0),
                      items: provider.exam.questions
                          .firstWhere((element) => element == question)
                          .options
                          .asMap()
                          .map(
                            (key, value) => MapEntry(
                              key,
                              DropdownMenuItem<int>(
                                value: key,
                                child: Text(
                                  value,
                                  style: AppStyles.subtitle1TextStyle,
                                ),
                              ),
                            ),
                          )
                          .values
                          .toList(),
                      isExpanded: true,
                      onChanged: (value) {
                        provider.answer = question.options[value!];
                        question.answer = provider.answer;
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<int>> _buildDropdownButton(List<String> list) {
    final List<DropdownMenuItem<int>> dropDownMenuItems = [];
    list.asMap().forEach((index, value) {
      dropDownMenuItems.add(
        DropdownMenuItem<int>(
          value: index,
          child: Text(
            value,
            style: AppStyles.subtitle1TextStyle,
          ),
        ),
      );
    });

    return dropDownMenuItems;
  }
}
