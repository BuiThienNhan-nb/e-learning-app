import 'package:e_learning_app/bases/presentation/atoms/w_image_network.dart';
import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/core/app/provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

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
            child: Container(
              height: avatarSize ?? AppDimens.extraLargeHeightDimens * 1.8,
              width: avatarSize ?? AppDimens.extraLargeWidthDimens * 1.8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: GetIt.I<AppProvider>().user.avatar == null ||
                      GetIt.I<AppProvider>().user.avatar!.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        "assets/icons/user_fill_icon.png",
                        color: AppColors.whiteColor,
                        fit: BoxFit.scaleDown,
                      ),
                    )
                  : WImageNetwork(
                      imageUrl: GetIt.I<AppProvider>().user.avatar!,
                      fit: BoxFit.cover,
                    ),
            )),
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
