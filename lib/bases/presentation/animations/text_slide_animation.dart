import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextSlideAnimation extends StatelessWidget {
  const TextSlideAnimation(
      {super.key,
      this.height = 50,
      this.animationDuration = const Duration(milliseconds: 500),
      required this.itemBuilder,
      required this.itemCount,
      required this.currentIndex,
      required this.beforeRankingIndex,
      this.curve = Curves.ease});

  final double height;
  final Duration animationDuration;
  final Widget Function(int index) itemBuilder;
  final int itemCount;
  final Curve curve;
  final int currentIndex;
  final int beforeRankingIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: height,
          child: Stack(
              fit: StackFit.expand,
              children: List.generate(itemCount, (index) {
                final swipeEndToStart = beforeRankingIndex > currentIndex &&
                    beforeRankingIndex == itemCount - 1 &&
                    currentIndex == 0;
                final swipeStartToEnd = beforeRankingIndex < currentIndex &&
                    beforeRankingIndex == 0 &&
                    currentIndex == itemCount - 1;
                if (swipeStartToEnd &&
                    index > beforeRankingIndex &&
                    index < currentIndex) {
                  return AnimatedPositioned(
                    key: Key('$index'),
                    top: -height,
                    curve: curve,
                    duration: animationDuration,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: height,
                    ),
                  );
                }
                if (swipeEndToStart &&
                    index < beforeRankingIndex &&
                    index > currentIndex) {
                  return AnimatedPositioned(
                    key: Key('$index'),
                    top: height,
                    curve: curve,
                    duration: animationDuration,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: height,
                    ),
                  );
                }
                if (index == currentIndex) {
                  {
                    return AnimatedPositioned(
                      key: Key('$index'),
                      top: 0,
                      curve: curve,
                      duration: animationDuration,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: height,
                        child: itemBuilder.call(index),
                      ),
                    );
                  }
                } else if (index > currentIndex) {
                  return AnimatedPositioned(
                    key: Key('$index'),
                    top: height,
                    curve: curve,
                    duration: animationDuration,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: height,
                      child: itemBuilder.call(index),
                    ),
                  );
                } else {
                  return AnimatedPositioned(
                    key: Key('$index'),
                    top: -height,
                    curve: curve,
                    duration: animationDuration,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: height,
                      child: itemBuilder.call(index),
                    ),
                  );
                }
              })),
        ),
      ],
    );
  }
}
