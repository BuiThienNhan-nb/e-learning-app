import 'package:flutter/material.dart';

import '../../../../bases/presentation/atoms/text_button.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../domain/entities/live_stream_model.dart';

class CurrentLiveStreamWidget extends StatelessWidget {
  const CurrentLiveStreamWidget({
    super.key,
    required this.liveStream,
    required this.onJoinButtonClick,
  });

  final LiveStreamModel liveStream;
  final Function() onJoinButtonClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimens.extraLargeWidthDimens,
        vertical: AppDimens.smallHeightDimens,
      ),
      padding: EdgeInsets.all(AppDimens.largeWidthDimens),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.neutral.shade300),
        borderRadius: BorderRadius.circular(AppDimens.largeRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${liveStream.userName}'s LiveStream.."),
          SizedBox(height: AppDimens.largeHeightDimens),
          Align(
            alignment: Alignment.centerRight,
            child: DefaultTextButton(
              submit: onJoinButtonClick,
              title: "Join now",
              width: AppDimens.extraLargeWidthDimens * 8,
            ),
          )
        ],
      ),
    );
  }
}
