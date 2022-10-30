import 'package:e_learning_app/configs/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../configs/colors.dart';

class CardPageView extends StatelessWidget {
  CardPageView({
    super.key,
    required this.height,
    // required this.width,
    required this.pages,
  });

  final double height;
  // final double width;
  final List<Widget> pages;

  final controller = PageController(
    viewportFraction: 1,
    keepPage: true,
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      // width: width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: controller,
            // itemCount: pages.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  AppDimens.extraLargeWidthDimens,
                  AppDimens.mediumHeightDimens,
                  AppDimens.extraLargeWidthDimens,
                  AppDimens.largeHeightDimens,
                ),
                child: pages[index % pages.length],
              );
            },
          ),
          Positioned(
            // bottom: AppDimens.mediumHeightDimens,
            child: CustomPageIndicator(
                controller: controller, count: pages.length),
          ),
        ],
      ),
    );
  }
}

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    super.key,
    required this.controller,
    required this.count,
  });

  final PageController controller;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      axisDirection: Axis.horizontal,
      effect: CustomizableEffect(
        spacing: 8.h,
        activeDotDecoration: DotDecoration(
          width: 16.w,
          height: 4.h,
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
        ),
        dotDecoration: DotDecoration(
          width: 4.w,
          height: 4.h,
          color: AppColors.neutral.shade400,
          borderRadius: BorderRadius.circular(AppDimens.extraItemRadius),
        ),
      ),
    );
  }
}
