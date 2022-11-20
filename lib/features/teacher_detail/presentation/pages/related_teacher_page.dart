import 'package:e_learning_app/bases/presentation/atoms/link_text.dart';
import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:e_learning_app/features/auth/sign_in/domain/entities/teacher_model.dart';
import 'package:flutter/material.dart';

import '../../../../bases/presentation/atoms/network_image.dart';
import '../../../../configs/dimens.dart';

class RelatedTeacherPage extends StatelessWidget {
  const RelatedTeacherPage({
    super.key,
    required this.teachers,
  });

  final List<TeacherModel> teachers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: teachers.length,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) =>
          RelatedTeacherItem(teacher: teachers[index]),
    );
  }
}

class RelatedTeacherItem extends StatelessWidget {
  const RelatedTeacherItem({
    super.key,
    required this.teacher,
  });

  final TeacherModel teacher;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(AppDimens.mediumWidthDimens),
      padding: EdgeInsets.all(AppDimens.largeWidthDimens),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DefaultNetworkImage(
            imageUrl: teacher.avatar!.url,
            blurHash: teacher.avatar!.blurHash,
            height: AppDimens.extraLargeHeightDimens * 2.8,
            width: AppDimens.extraLargeWidthDimens * 2.8,
          ),
          SizedBox(width: AppDimens.mediumWidthDimens),
          Expanded(
            child: LinkText(
              contentText1: teacher.name,
              contentText2: "\nThis is Teacher's bio!",
              onTap1: () {},
              onTap2: () {},
              text1Style: AppStyles.subtitle1TextStyle.copyWith(
                fontWeight: FontWeight.w700,
              ),
              text2Style: AppStyles.subtitle2TextStyle.copyWith(
                color: AppColors.neutral.shade800,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(width: AppDimens.mediumWidthDimens),
          Image.asset(
            "assets/icons/messenger_icon.png",
            color: AppColors.primaryColor,
          )
        ],
      ),
    );
  }
}
