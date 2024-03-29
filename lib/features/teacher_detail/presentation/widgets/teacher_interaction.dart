import 'package:e_learning_app/bases/presentation/atoms/link_text.dart';
import 'package:e_learning_app/configs/dimens.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:e_learning_app/features/auth/sign_in/domain/entities/teacher_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../../bases/presentation/atoms/network_image.dart';
import '../../../../configs/colors.dart';
import '../states/teacher_detail_store.dart';

class TeacherInteraction extends StatelessWidget {
  const TeacherInteraction({
    super.key,
    required this.teacher,
    this.width,
  });

  final double? width;
  final TeacherModel teacher;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                tag: "${teacher.id}.${teacher.name}",
                child: teacher.avatar == null
                    ? Container(
                        height: AppDimens.extraLargeHeightDimens * 3.4,
                        width: AppDimens.extraLargeWidthDimens * 3.4,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          borderRadius: null,
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
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
                        height: AppDimens.extraLargeHeightDimens * 3.4,
                        width: AppDimens.extraLargeWidthDimens * 3.4,
                      ),
              ),
              // SizedBox(
              //   height: ,
              // ),
            ],
          ),
          Observer(
            builder: (_) => SizedBox(
              child: LinkText(
                contentText1:
                    "${context.read<TeacherDetailStore>().courses?.length ?? 0}\n",
                text1Style: AppStyles.subtitle1TextStyle.copyWith(
                  fontWeight: FontWeight.w900,
                ),
                contentText2: "Courses",
                text2Style: AppStyles.subtitle1TextStyle,
                onTap1: () {},
                onTap2: () {},
              ),
            ),
          ),
          VerticalDivider(
            thickness: AppDimens.smallWidthDimens / 5,
          ),
          SizedBox(
            // width: width ?? AppDimens.appDesignSize.width / 3,
            child: LinkText(
              contentText1: "22317\n",
              text1Style: AppStyles.subtitle1TextStyle.copyWith(
                fontWeight: FontWeight.w900,
              ),
              contentText2: "Students Enroll",
              text2Style: AppStyles.subtitle1TextStyle,
              onTap1: () {},
              onTap2: () {},
            ),
          ),
          VerticalDivider(
            thickness: AppDimens.smallWidthDimens / 5,
          ),
          SizedBox(
            // width: width ?? AppDimens.appDesignSize.width / 3,
            child: LinkText(
              contentText1: "913\n",
              text1Style: AppStyles.subtitle1TextStyle.copyWith(
                fontWeight: FontWeight.w900,
              ),
              contentText2: "Reviews",
              text2Style: AppStyles.subtitle1TextStyle,
              onTap1: () {},
              onTap2: () {},
            ),
          ),
        ],
      ),
    );
  }
}
