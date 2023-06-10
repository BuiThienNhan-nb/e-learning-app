import 'package:carousel_list/carousel_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarouselRankingList extends StatelessWidget {
  CarouselRankingList(
      {Key? key,
      this.isLoop = true,
      required this.itemBuilder,
      required this.itemCount,
      required this.onItemChanged,
      required this.onItemClicked,
      this.itemHeight = 200,
      this.itemWidth = 200,
      this.curve = Curves.ease})
      : super(key: key);
  final bool isLoop;

  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final Function(int currentItem) onItemChanged;
  final Function(int index) onItemClicked;
  final SwiperController _controller = SwiperController();

  final double itemHeight;

  final double itemWidth;

  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return Swiper(
      onTap: onItemClicked,
      index: 0,
      onIndexChanged: onItemChanged,
      curve: curve,
      itemWidth: itemWidth,
      controller: _controller,
      layout: SwiperLayout.STACK,
      itemHeight: itemHeight,
      loop: isLoop,
      itemBuilder: itemBuilder,
      itemCount: itemCount,
      scrollDirection: Axis.horizontal,
    );
  }
}
