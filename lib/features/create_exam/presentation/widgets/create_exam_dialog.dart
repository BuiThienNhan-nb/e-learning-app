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
    required this.questionIndex,
  });

  final Function() onSubmitQuestion;
  final String questionTitle;
  final int questionIndex;
  late final titleController = TextEditingController(
    text: questionTitle,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateExamProvider>(
      builder: (_, provider, __) => AlertDialog(
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
              provider.exam.questions[questionIndex].title =
                  titleController.text.trim();
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
                // onChanged: (value) => titleController
                //   ..text = value
                //   ..selection = TextSelection.collapsed(
                //       offset: titleController.text.length),
                onSubmitted: (value) => titleController.text = value.trim(),
              ),
              TextField(
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
                          provider.removeOption(questionIndex);
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      IconButton(
                        onPressed: () {
                          provider.addOption(questionIndex);
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
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
              SizedBox(
                height: AppDimens.extraLargeHeightDimens * 5,
                width: double.maxFinite,
                child: ListView.builder(
                  itemCount: provider.numberOfOptions,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => TextField(
                    controller: TextEditingController(
                      text:
                          provider.exam.questions[questionIndex].options[index],
                    ),
                    decoration: InputDecoration(
                      hintText: "Option ${index + 1}",
                    ),
                    onChanged: (value) => provider.exam.questions[questionIndex]
                        .options[index] = value.trim(),
                    onSubmitted: (value) => provider.exam
                        .questions[questionIndex].options[index] = value.trim(),
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
              DropdownButton<int>(
                value: provider.exam.questions[questionIndex].options
                    .indexWhere(
                        (element) => element.compareTo(provider.answer) == 0),
                items: _buildDropdownButton(
                    provider.exam.questions[questionIndex].options),
                isExpanded: true,
                onChanged: (value) {
                  provider.answer =
                      provider.exam.questions[questionIndex].options[value!];
                  provider.exam.questions[questionIndex].answer =
                      provider.answer;
                },
              )
            ],
          ),
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
