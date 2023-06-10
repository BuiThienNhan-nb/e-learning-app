import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../bases/presentation/atoms/skeleton.dart';
import '../../../../bases/presentation/atoms/w_image_network.dart';
import '../../../../configs/colors.dart';
import '../../../../utils/app_utils.dart';
import '../top_presenter.dart';

class KeyVisualLoading extends StatelessWidget {
  const KeyVisualLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 495,
      child: Skeleton(
        leftPadding: 20,
        rightPadding: 20,
        topPadding: Utils.instance.getStatusBarHeight(context) + 0,
      ),
    );
  }
}

class KeyVisual extends StatelessWidget {
  const KeyVisual({
    super.key,
    required this.imageUrls,
    required this.presenter,
  });

  final List<String> imageUrls;
  final TopPresenter presenter;

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final themeColor = Theme.of(context);

    return SizedBox(
      width: widthScreen,
      height: 585,
      child: Stack(
        children: [
          if (imageUrls.isNotEmpty)
            PageView.builder(
              physics: const ClampingScrollPhysics(),
              controller: presenter.visualController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  WImageNetwork(imageUrl: imageUrls[index % imageUrls.length]),
            ),
          Positioned(
            bottom: -1,
            child: Container(
              width: widthScreen,
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    themeColor.scaffoldBackgroundColor.withOpacity(0.0),
                    themeColor.scaffoldBackgroundColor.withOpacity(0.8),
                    themeColor.scaffoldBackgroundColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [
                    0,
                    0.5,
                    0.74,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 75,
            left: (widthScreen - 90) * 0.5,
            child: Center(
              child: Container(
                height: 20,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: themeColor.scaffoldBackgroundColor,
                ),
                child: Center(
                  child: SmoothPageIndicator(
                    controller: presenter.visualController,
                    count: imageUrls.length,
                    axisDirection: Axis.horizontal,
                    effect: const ExpandingDotsEffect(
                      dotColor: AppColors.iconDisabled,
                      activeDotColor: AppColors.iconActive,
                      dotHeight: 5,
                      dotWidth: 5,
                      spacing: 5,
                      expansionFactor: 6,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
