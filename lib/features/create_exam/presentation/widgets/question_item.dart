import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/styles.dart';
import '../../domain/entities/question_model.dart';

class QuestionItemWidget extends StatelessWidget {
  const QuestionItemWidget({
    super.key,
    required this.question,
    required this.editCallback,
    required this.deleteCallback,
  });

  final QuestionModel question;
  final Function() editCallback;
  final Function() deleteCallback;

  @override
  Widget build(BuildContext context) {
    final textStyle = AppStyles.subtitle1TextStyle;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppDimens.mediumHeightDimens,
        horizontal: AppDimens.mediumWidthDimens,
      ),
      child: Stack(
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
          ),
        ],
      ),
    );
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
