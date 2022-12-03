import 'package:e_learning_app/bases/presentation/atoms/text_button.dart';
import 'package:e_learning_app/bases/presentation/atoms/text_form_field.dart';
import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/configs/dimens.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CourseAddReviewDialog extends StatelessWidget {
  const CourseAddReviewDialog({
    super.key,
    required this.onFieldSubmitted,
  });

  final Function(String, int)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    int rate = 0;
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
        "Leave a review for your course",
        style: AppStyles.headline6TextStyle,
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DefaultTextFormField(
            labelText: "",
            controller: controller,
            hintText: "Write your thought about this course...",
            onFieldSubmitted: (value) => onFieldSubmitted!(value, rate),
            maxLines: 5,
          ),
          SizedBox(height: AppDimens.mediumHeightDimens),
          RatingBar.builder(
            initialRating: 5,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemPadding:
                EdgeInsets.symmetric(horizontal: AppDimens.smallWidthDimens),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: AppColors.primaryColor,
            ),
            onRatingUpdate: (rating) {
              rate = rating.toInt();
            },
            tapOnlyMode: true,
          ),
          SizedBox(height: AppDimens.mediumHeightDimens),
        ],
      ),
      actions: [
        SizedBox(height: AppDimens.smallHeightDimens),
        DefaultTextButton(
          submit: () => Navigator.of(context).pop(),
          title: "Cancel",
          backgroundColor: AppColors.primaryColor.withOpacity(0.1),
          titleStyle: AppStyles.headline6TextStyle.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        DefaultTextButton(
          submit: () => onFieldSubmitted!(controller.text.trim(), rate),
          title: "Submit",
        ),
      ],
    );
  }
}
