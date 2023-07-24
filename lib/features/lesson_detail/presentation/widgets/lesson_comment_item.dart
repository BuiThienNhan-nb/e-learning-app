import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/configs/formats.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:e_learning_app/features/lesson_detail/domain/entities/lesson_comment_model.dart';
import 'package:flutter/material.dart';

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
    // context.read<LessonDetailPageProvider>().getAvatarById(comment.userId);

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
          // Selector<LessonDetailPageProvider, bool>(
          //   builder: (_, isGetAvatar, __) => Container(
          //     height: AppDimens.extraLargeHeightDimens * 1.4,
          //     width: AppDimens.extraLargeWidthDimens * 1.4,
          //     decoration: const BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: AppColors.placeholderLightMode,
          //     ),
          //     child: isGetAvatar
          //         ? null
          //         : ClipRRect(
          //             borderRadius: BorderRadius.circular(100),
          //             child: WImageNetwork(
          //               imageUrl:
          //                   context.read<LessonDetailPageProvider>().avatar,
          //               fit: BoxFit.cover,
          //             ),
          //           ),
          //   ),
          //   selector: (_, provider) => provider.isGetAvatar,
          // ),
          Container(
            height: AppDimens.extraLargeHeightDimens * 1.4,
            width: AppDimens.extraLargeWidthDimens * 1.4,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.placeholderLightMode,
            ),
            child: null,
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
