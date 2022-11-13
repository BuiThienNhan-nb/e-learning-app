import 'package:e_learning_app/configs/styles.dart';
import 'package:flutter/material.dart';

import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';

class TeacherInteractButtonRow extends StatelessWidget {
  const TeacherInteractButtonRow({
    super.key,
    required this.teacherId,
  });

  final String teacherId;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: AppDimens.smallWidthDimens),
        Expanded(
          child: TeacherInteractButton(
            icon: const Icon(Icons.message),
            label: "Message",
            onPressed: () {},
            isPrimary: true,
          ),
        ),
        SizedBox(width: AppDimens.mediumWidthDimens),
        Expanded(
          child: TeacherInteractButton(
            icon: const Icon(Icons.message),
            label: "Follow",
            onPressed: () {},
          ),
        ),
        SizedBox(width: AppDimens.smallWidthDimens),
      ],
    );
  }
}

class TeacherInteractButton extends StatelessWidget {
  TeacherInteractButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isPrimary = false,
  });

  final Widget icon;
  final String label;
  final Function() onPressed;
  bool isPrimary = false;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const SizedBox.shrink(),
      label: Text(
        label,
        style: AppStyles.subtitle1TextStyle,
      ),
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor:
            isPrimary ? AppColors.whiteColor : AppColors.primaryColor,
        backgroundColor:
            isPrimary ? AppColors.primaryColor : AppColors.neutral.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
          side: isPrimary
              ? BorderSide.none
              : const BorderSide(
                  color: AppColors.secondaryColor,
                ),
        ),
      ),
    );
  }
}
