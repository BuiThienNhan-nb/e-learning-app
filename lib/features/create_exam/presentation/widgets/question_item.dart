import 'package:e_learning_app/features/create_exam/presentation/states/create_exam_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/styles.dart';
import '../../domain/entities/question_model.dart';

class QuestionItemWidget extends StatelessWidget {
  const QuestionItemWidget({
    super.key,
    // required this.questionIndex,
    required this.questions,
    required this.editCallback,
    required this.deleteCallback,
    required this.canCreate,
  });

  // final int questionIndex;
  final QuestionModel questions;
  final Function() editCallback;
  final Function() deleteCallback;
  final bool canCreate;

  @override
  Widget build(BuildContext context) {
    final textStyle = AppStyles.subtitle1TextStyle;
    // final provider = context.read<CreateExamProvider>();

    Widget mainBody(QuestionModel question) => Column(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: question.options
                  .map(
                    (e) => OptionRadioButton(
                      title: e,
                      value: e,
                      groupValue: question.answer,
                    ),
                  )
                  .toList(),
            )
          ],
        );

    return Selector<CreateExamProvider, String>(
        selector: (_, provider) => provider.exam.questions
            .firstWhere((element) => element == questions)
            .title,
        builder: (_, title, __) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppDimens.mediumHeightDimens,
              horizontal: AppDimens.mediumWidthDimens,
            ),
            child: canCreate
                ? Stack(
                    fit: StackFit.loose,
                    children: [
                      Positioned(
                        right: 28.w,
                        child: IconButton(
                          onPressed: editCallback,
                          icon: const Icon(Icons.edit),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          onPressed: deleteCallback,
                          icon: const Icon(Icons.delete),
                        ),
                      ),
                      Column(
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
                            title,
                            style: textStyle,
                          ),
                          SizedBox(height: AppDimens.largeHeightDimens),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: questions.options
                                .map(
                                  (e) => OptionRadioButton(
                                    title: e,
                                    value: e,
                                    groupValue: questions.answer,
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ],
                  )
                : mainBody(questions),
          );
        });
  }
}

class OptionRadioButton extends StatelessWidget {
  OptionRadioButton({
    super.key,
    required this.title,
    required this.value,
    this.groupValue,
  });

  final String title;
  final String value;
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
        onChanged: (value) {},
        title: Text(
          value,
          style: AppStyles.subtitle1TextStyle,
        ),
      ),
    );
  }
}
