import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/configs/dimens.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:flutter/material.dart';

import '../states/provider/chat_provider.dart';

class ChatBottomAction extends StatelessWidget {
  const ChatBottomAction({
    super.key,
    required this.provider,
  });

  final ChatProvider provider;

  @override
  Widget build(BuildContext context) {
    _sendMessage() {
      // Send message submit
    }

    return SafeArea(
      bottom: true,
      top: false,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: TextField(
                controller: provider.chatController,
                style: AppStyles.subtitle1TextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                decoration: const InputDecoration(
                  hintText: 'Message...',
                  border: InputBorder.none,
                ),
                onSubmitted: (_) => _sendMessage(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppDimens.largeWidthDimens,
              horizontal: AppDimens.largeHeightDimens,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(200),
              onTap: _sendMessage,
              child: Container(
                padding: EdgeInsets.all(AppDimens.mediumWidthDimens),
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  "assets/icons/paper_plane_fill_icon.png",
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
