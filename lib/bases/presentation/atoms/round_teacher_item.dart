import 'package:e_learning_app/features/auth/sign_in/domain/entities/teacher_model.dart';
import 'package:flutter/material.dart';

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
          DefaultNetworkImage(
            imageUrl: teacher.avatar!.url,
            blurHash: teacher.avatar!.blurHash,
            height: AppDimens.extraLargeHeightDimens * 3.2,
            width: AppDimens.extraLargeWidthDimens * 3.2,
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
