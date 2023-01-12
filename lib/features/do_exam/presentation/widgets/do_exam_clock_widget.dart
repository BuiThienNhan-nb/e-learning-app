import 'dart:developer';

import 'package:e_learning_app/features/do_exam/presentation/state/do_exam_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../configs/dimens.dart';
import '../../../../configs/styles.dart';

class DoExamOClockWidget extends StatefulWidget {
  const DoExamOClockWidget({
    Key? key,
    required this.minutes,
    required this.timeOutCallback,
  }) : super(key: key);

  final int minutes;
  final Function() timeOutCallback;

  @override
  State<DoExamOClockWidget> createState() => _DoExamOClockWidgetState();
}

class _DoExamOClockWidgetState extends State<DoExamOClockWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;

  String get countDownText {
    Duration count = controller.duration! * controller.value;
    return "${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}";
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(minutes: widget.minutes, seconds: 2),
    );
    controller.reverse(
      from: controller.value == 0 ? 1.0 : controller.value,
    );
    controller.addListener(() {
      if (countDownText.compareTo("0:00:00") == 0) {
        widget.timeOutCallback();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DoExamProvider>(
      builder: (_, provider, __) {
        if (provider.isDone) {
          log("DoExam is done!");
          controller.stop(canceled: true);
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Time left:",
              style: AppStyles.headline6TextStyle,
            ),
            SizedBox(width: AppDimens.mediumWidthDimens),
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) => Text(
                countDownText,
                style: AppStyles.headline6TextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
