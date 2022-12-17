import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/configs/formats.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:e_learning_app/features/lesson_detail/domain/entities/lesson_comment_model.dart';
import 'package:flutter/material.dart';

import '../../../../bases/presentation/atoms/network_image.dart';
import '../../../../configs/dimens.dart';

class LessonCommentItem extends StatelessWidget {
  const LessonCommentItem({
    super.key,
    required this.comment,
    // this.replyOnTab,
    // required this.haveReplies,
  });

  final LessonCommentModel comment;
  // final Function()? replyOnTab;
  // final bool haveReplies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppDimens.mediumWidthDimens,
        AppDimens.largeHeightDimens,
        AppDimens.mediumWidthDimens,
        AppDimens.smallHeightDimens,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          DefaultNetworkImage(
            imageUrl:
                "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
            blurHash: "LDH.KN?b1*Os009EyDRjp{o#ve%1",
            height: AppDimens.extraLargeHeightDimens * 1.4,
            width: AppDimens.extraLargeWidthDimens * 1.4,
          ),
          SizedBox(width: AppDimens.largeWidthDimens),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${comment.userName} • ${AppFormats.instance.timeAgo(comment.commentAt)}",
                  style: AppStyles.subtitle2TextStyle.copyWith(
                    color: AppColors.neutral.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: AppDimens.smallHeightDimens),
                Text(
                  comment.content,
                  style: AppStyles.subtitle1TextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
