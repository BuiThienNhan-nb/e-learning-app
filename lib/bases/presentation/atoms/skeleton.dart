import 'package:e_learning_app/configs/colors.dart';
import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    super.key,
    this.height = double.infinity,
    this.width = double.infinity,
    this.topPadding = 0.0,
    this.bottomPadding = 0.0,
    this.leftPadding = 0.0,
    this.rightPadding = 0.0,
  });

  final double height;
  final double width;
  final double topPadding;
  final double bottomPadding;
  final double rightPadding;
  final double leftPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.fromLTRB(
        leftPadding,
        topPadding,
        rightPadding,
        bottomPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.placeholderLightMode,
      ),
    );
  }
}
