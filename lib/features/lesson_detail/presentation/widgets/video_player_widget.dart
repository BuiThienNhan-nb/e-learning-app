import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../utils/extensions/context_extension.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({
    super.key,
    required this.videoUrl,
  });

  final String videoUrl;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late final VideoPlayerController _controller;
  ChewieController? _chewieController;
  late Future<void> _isInitializedVideo;

  Future<void> _initializePlayer() async {
    _controller = VideoPlayerController.network(
      widget.videoUrl,
      // "https://firebasestorage.googleapis.com/v0/b/flutter-app-nln.appspot.com/o/video%2FPh%C3%BA%20Y%C3%AAn%2Fandroid_report.mp4?alt=media&token=d5dfe3b6-1c9b-4827-98dc-36d53d1437a4",
    );
    _isInitializedVideo = _controller.initialize();
    await _isInitializedVideo;

    _chewieController = ChewieController(
      placeholder: Container(
        color: AppColors.neutral.shade900,
        height: double.infinity,
        width: double.infinity,
      ),
      subtitleBuilder: (_, subtitle) => Container(
        child: subtitle,
        margin: EdgeInsets.symmetric(
          horizontal: AppDimens.largeWidthDimens,
        ),
        decoration: BoxDecoration(
          color: AppColors.neutral.shade900.withOpacity(0.7),
          borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.largeWidthDimens,
          vertical: AppDimens.smallHeightDimens,
        ),
      ),
      subtitle: Subtitles(
        [
          Subtitle(
            index: 0,
            start: const Duration(seconds: 0),
            end: _controller.value.duration,
            text: Text(
              'This is the video subtitle.',
              textAlign: TextAlign.center,
              style: context.textTheme.subtitle2?.copyWith(
                color: AppColors.neutral.shade50,
              ),
            ),
          )
        ],
      ),
      videoPlayerController: _controller,
      // aspectRatio: 16 / 9,
      allowFullScreen: true,
      allowedScreenSleep: true,
      // autoPlay: true,
      looping: true,
      allowMuting: true,
      showControlsOnInitialize: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
      ],
      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ],
      allowPlaybackSpeedChanging: true,
      // startAt: const Duration(seconds: 33),
      optionsTranslation: OptionsTranslation(
        subtitlesButtonText: 'cc',
        cancelButtonText: 'cancel',
        playbackSpeedButtonText: 'playback',
      ),
    );
  }

  @override
  void initState() {
    _initializePlayer();
    _controller.addListener(() {
      // log(_controller.value.position.inSeconds.toString());
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(context.read<LessionPageProvider>().second);
    return Container(
      color: AppColors.neutral.shade900,
      height: 0.25.sh,
      width: double.infinity,
      child: Center(
        child: FutureBuilder(
          future: _isInitializedVideo,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text(
                  'This video is removed. Please visit later',
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: AppColors.neutral.shade50,
                    fontWeight: FontWeight.bold,
                  ),
                );
              } else {
                return Chewie(controller: _chewieController!);
              }
            } else {
              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  AppColors.neutral.shade50,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
