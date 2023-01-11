import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/styles.dart';
import '../../../create_exam/domain/entities/question_model.dart';
import '../state/do_exam_provider.dart';

class DoQuestionItem extends StatelessWidget {
  const DoQuestionItem({
    super.key,
    required this.question,
    required this.questionIndex,
  });

  final QuestionModel question;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    final textStyle = AppStyles.subtitle1TextStyle;
    // String? selectedValue;

    return Consumer<DoExamProvider>(
      builder: (_, provider, __) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppDimens.mediumHeightDimens,
          horizontal: AppDimens.mediumWidthDimens,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Question",
              style: textStyle,
            ),
            SizedBox(height: AppDimens.mediumHeightDimens),
            Text(
              question.title,
              style: textStyle,
            ),
            SizedBox(height: AppDimens.largeHeightDimens),
            ListView.builder(
              itemCount: question.options.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => OptionRadioButton(
                title: question.options[index],
                value: question.options[index],
                groupValue: provider.answers[questionIndex],
                onChanged: (value) {
                  if (!provider.isDone) {
                    provider.updateAnswers(questionIndex, value!);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionRadioButton extends StatelessWidget {
  OptionRadioButton({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.groupValue,
  });

  final String title;
  final String value;
  final Function(String?) onChanged;
  String? groupValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppDimens.smallHeightDimens),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.secondaryColor,
          // width: 0.2,
        ),
      ),
      child: RadioListTile<String>(
        activeColor: AppColors.primaryColor,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        title: Text(
          value,
          style: AppStyles.subtitle1TextStyle,
        ),
      ),
    );
  }
}
