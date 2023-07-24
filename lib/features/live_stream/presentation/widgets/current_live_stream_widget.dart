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
          Text(
            "${liveStream.userName}'s LiveStream..",
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
          ),
          SizedBox(height: AppDimens.largeHeightDimens),
          Align(
            alignment: Alignment.centerRight,
            child: DefaultTextButton(
              submit: onJoinButtonClick,
              titleStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.white,
                    fontSize: 14,
                  ),
              title: "Join now",
              height: 48,
              width: 140,
            ),
          )
        ],
      ),
    );
  }
}
