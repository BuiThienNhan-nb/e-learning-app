import 'package:flutter/material.dart';

class WContainerBlurGradient extends StatelessWidget {
  const WContainerBlurGradient({
    super.key,
    required this.topWidget,
    required this.bottomWidget,
    this.height,
  });

  final Widget topWidget;
  final Widget bottomWidget;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: topWidget,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: bottomWidget,
          ),
        ],
      ),
    );
  }
}
