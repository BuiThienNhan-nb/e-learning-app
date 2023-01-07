import 'package:e_learning_app/features/auth/sign_in/domain/entities/teacher_model.dart';
import 'package:flutter/material.dart';

import '../../../configs/colors.dart';
import '../../../configs/dimens.dart';
import '../../../configs/styles.dart';
import 'network_image.dart';

class RoundTeacherItem extends StatelessWidget {
  const RoundTeacherItem({
    super.key,
    this.height,
    required this.teacher,
  });

  final double? height;
  final TeacherModel teacher;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: height ?? AppDimens.extraLargeWidthDimens * 3.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.neutral.shade200),
              boxShadow: [
                BoxShadow(
                  color: AppColors.neutral.shade400,
                  blurRadius: AppDimens.mediumHeightDimens,
                  // offset: const Offset(1, 1),
                  blurStyle: BlurStyle.normal,
                  spreadRadius: 0.2,
                ),
              ],
            ),
            child: teacher.avatar == null
                ? Container(
                    height: AppDimens.extraLargeHeightDimens * 3,
                    width: AppDimens.extraLargeWidthDimens * 3,
                    padding: EdgeInsets.all(AppDimens.largeWidthDimens),
                    child: Image.asset(
                      "assets/icons/user_fill_icon.png",
                      color: AppColors.neutral.shade500,
                      fit: BoxFit.fill,
                    ),
                  )
                : DefaultNetworkImage(
                    imageUrl: teacher.avatar!,
                    blurHash: "LLHn?Bs:.mS\$-:t6WBjZENRkrrs.",
                    height: AppDimens.extraLargeHeightDimens * 3.2,
                    width: AppDimens.extraLargeWidthDimens * 3.2,
                  ),
          ),
          SizedBox(height: AppDimens.smallHeightDimens),
          SizedBox(
            width: AppDimens.extraLargeWidthDimens * 3.5,
            child: Text(
              teacher.name,
              textAlign: TextAlign.center,
              style: AppStyles.subtitle1TextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }
}
