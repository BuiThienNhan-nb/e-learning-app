import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../bases/presentation/atoms/network_image.dart';
import '../../../../configs/dimens.dart';
import '../states/provider/lesson_detail_provider.dart';

class LessonCommentTextField extends StatelessWidget {
  LessonCommentTextField({
    super.key,
    this.avatarSize,
    this.paddingLeft,
    required this.onCommentSubmit,
  });

  final Function(String)? onCommentSubmit;
  double? avatarSize;
  double? paddingLeft;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LessonDetailPageProvider>();
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 0,
          vertical: AppDimens.largeHeightDimens,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.fromLTRB(
            paddingLeft ?? AppDimens.mediumWidthDimens,
            AppDimens.mediumWidthDimens,
            AppDimens.mediumWidthDimens,
            AppDimens.mediumWidthDimens,
          ),
          child: DefaultNetworkImage(
            imageUrl:
                "https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
            blurHash: "LRI;VLIU0fs,00^+%NoL.TRk,:Ri",
            height: avatarSize ?? AppDimens.extraLargeHeightDimens * 1.8,
            width: avatarSize ?? AppDimens.extraLargeWidthDimens * 1.8,
          ),
        ),
        hintText: "Write your comment...",
      ),
      controller: provider.commentController,
      onSubmitted: (value) {
        provider.commentController.clear();
        onCommentSubmit!(value.trim());
      },
    );
  }
}
