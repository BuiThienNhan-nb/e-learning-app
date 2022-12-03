import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/colors.dart';
import '../../../configs/dimens.dart';
import '../../../configs/styles.dart';
import '../../../generated/translations/locale_keys.g.dart';
import '../../../utils/extensions/context_extension.dart';

import 'dart:ui' as ui;

class DefaultResultDialog extends StatefulWidget {
  const DefaultResultDialog({
    Key? key,
    required this.isError,
    required this.content,
  }) : super(key: key);

  final bool isError;
  final String content;

  @override
  State<DefaultResultDialog> createState() => _DefaultResultDialog();
}

class _DefaultResultDialog extends State<DefaultResultDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    scaleAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.elasticOut,
    );

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        widget.isError ? AppColors.primaryColor : AppColors.pigmentGreenColor;

    return Center(
      child: ScaleTransition(
        scale: scaleAnimation,
        child: SizedBox(
          width: 320.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: Transform.rotate(
                  angle: -pi / 36.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(
                        AppDimens.itemRadius,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: AppColors.whiteColor),
                  borderRadius: BorderRadius.circular(
                    AppDimens.itemRadius,
                  ),
                ),
                padding: EdgeInsets.all(AppDimens.extraLargeHeightDimens),
                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.isError ? "Oh Snap!" : LocaleKeys.success.tr(),
                        style: AppStyles.headline4TextStyle.copyWith(
                          fontWeight: FontWeight.w800,
                          color: primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "\n${widget.content}\n",
                        style: context.textTheme.subtitle1?.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: SizedBox(
                          child: Text(
                            widget.isError
                                ? LocaleKeys.tryAgain.tr().toUpperCase()
                                : LocaleKeys.continues.tr().toUpperCase(),
                            style: context.textTheme.subtitle1?.copyWith(
                              color: primaryColor,
                              letterSpacing: 2.w,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuaterCirclePainter extends CustomPainter {
  QuaterCirclePainter({required this.color}) : super();

  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    const Offset center = Offset(0, 0);

    canvas.drawCircle(center, size.width / 4.w, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class IconPainter extends CustomPainter {
  final IconData icon;

  IconPainter({required this.icon});
  @override
  void paint(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter(textDirection: ui.TextDirection.rtl);
    textPainter.text = TextSpan(
      text: String.fromCharCode(icon.codePoint),
      style: TextStyle(
        fontSize: 40.r,
        fontFamily: icon.fontFamily,
        color: AppColors.whiteColor,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(size.width / 20.w, size.height / 20.h));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
