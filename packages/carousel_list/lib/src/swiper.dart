import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_list/carousel_list.dart';
import 'package:carousel_list/src/transformer_page_view/transformer_page_view.dart';

part 'custom_layout.dart';

typedef SwiperOnTap = void Function(int index);

typedef SwiperDataBuilder = Widget Function(
    BuildContext context, dynamic data, int index);

const int kMaxValue = 2000000000;
const int kMiddleValue = 1000000000;

enum SwiperLayout { DEFAULT, STACK, TINDER, CUSTOM }

class Swiper extends StatefulWidget {
  /// If set true , the pagination will display 'outer' of the 'content' container.
  final bool outer;

  /// Inner item height, this property is valid if layout=STACK or layout=TINDER or LAYOUT=CUSTOM,
  final double itemHeight;

  /// Inner item width, this property is valid if layout=STACK or layout=TINDER or LAYOUT=CUSTOM,
  final double itemWidth;

  // height of the inside container,this property is valid when outer=true,otherwise the inside container size is controlled by parent widget
  final double? containerHeight;

  // width of the inside container,this property is valid when outer=true,otherwise the inside container size is controlled by parent widget
  final double? containerWidth;

  /// Build item on index
  final IndexedWidgetBuilder itemBuilder;

  /// Support transform like Android PageView did
  /// `itemBuilder` and `transformItemBuilder` must have one not null
  final PageTransformer? transformer;

  /// count of the display items
  final int itemCount;

  final ValueChanged<int>? onIndexChanged;

  ///horizontal/vertical
  final Axis scrollDirection;

  ///transition curve
  final Curve curve;

  /// Set to false to disable continuous loop mode.
  final bool loop;

  ///Index number of initial slide.
  ///If not set , the `Swiper` is 'uncontrolled', which means manage index by itself
  ///If set , the `Swiper` is 'controlled', which means the index is fully managed by parent widget.
  final int? index;

  ///Called when tap
  final SwiperOnTap? onTap;

  ///The swiper pagination plugin
  final SwiperPlugin? pagination;

  ///the swiper control button plugin
  final SwiperPlugin? control;

  ///other plugins, you can custom your own plugin
  final List<SwiperPlugin>? plugins;

  ///
  final SwiperController? controller;

  final ScrollPhysics? physics;

  ///
  final double viewportFraction;

  /// Build in layouts
  final SwiperLayout? layout;

  // This value is valid when viewportFraction is set and < 1.0
  final double? scale;

  // This value is valid when viewportFraction is set and < 1.0
  final double? fade;

  final PageIndicatorLayout indicatorLayout;

  const Swiper({
    required this.itemBuilder,
    this.indicatorLayout = PageIndicatorLayout.NONE,

    ///
    this.transformer,
    required this.itemCount,
    this.layout = SwiperLayout.DEFAULT,
    this.onIndexChanged,
    this.index,
    this.onTap,
    this.control,
    this.loop = true,
    this.curve = Curves.ease,
    this.scrollDirection = Axis.horizontal,
    this.pagination,
    this.plugins,
    this.physics,
    Key? key,
    this.controller,

    /// since v1.0.0
    this.containerHeight,
    this.containerWidth,
    this.viewportFraction = 1.0,
    this.itemHeight = double.infinity,
    this.itemWidth = double.infinity,
    this.outer = false,
    this.scale,
    this.fade,
  })  : assert(
            !loop ||
                ((loop &&
                        layout == SwiperLayout.DEFAULT &&
                        (indicatorLayout == PageIndicatorLayout.SCALE ||
                            indicatorLayout == PageIndicatorLayout.COLOR ||
                            indicatorLayout == PageIndicatorLayout.NONE)) ||
                    (loop && layout != SwiperLayout.DEFAULT)),
            "Only support `PageIndicatorLayout.SCALE` and `PageIndicatorLayout.COLOR`when layout==SwiperLayout.DEFAULT in loop mode"),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SwiperState();
  }
}

abstract class _SwiperTimerMixin extends State<Swiper> {
  SwiperController? _controller;

  @override
  void initState() {
    _controller = widget.controller;
    _controller ??= SwiperController();
    super.initState();
  }

  @override
  void didUpdateWidget(Swiper oldWidget) {
    super.didUpdateWidget(oldWidget);
  }
}

class _SwiperState extends _SwiperTimerMixin {
  int _activeIndex = 0;

  TransformerPageController? _pageController;

  Widget _wrapTap(BuildContext context, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!(index);
        }
      },
      child: widget.itemBuilder(context, index),
    );
  }

  @override
  void initState() {
    _activeIndex = widget.index ?? 0;
    if (_isPageViewLayout()) {
      _pageController = TransformerPageController(
          initialPage: widget.index ?? 0,
          loop: widget.loop,
          itemCount: widget.itemCount,
          reverse:
              widget.transformer == null ? false : widget.transformer!.reverse,
          viewportFraction: widget.viewportFraction);
    }
    super.initState();
  }

  bool _isPageViewLayout() {
    return widget.layout == null || widget.layout == SwiperLayout.DEFAULT;
  }

  bool _getReverse(Swiper widget) =>
      widget.transformer == null ? false : widget.transformer!.reverse;

  @override
  void didUpdateWidget(Swiper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_isPageViewLayout()) {
      if (_pageController == null ||
          (widget.index != oldWidget.index ||
              widget.loop != oldWidget.loop ||
              widget.itemCount != oldWidget.itemCount ||
              widget.viewportFraction != oldWidget.viewportFraction ||
              _getReverse(widget) != _getReverse(oldWidget))) {
        _pageController = TransformerPageController(
            initialPage: widget.index ?? 0,
            loop: widget.loop,
            itemCount: widget.itemCount,
            reverse: _getReverse(widget),
            viewportFraction: widget.viewportFraction);
      }
    } else {
      scheduleMicrotask(() {
        // So that we have a chance to do `removeListener` in child widgets.
        if (_pageController != null) {
          _pageController?.dispose();
          _pageController = null;
        }
      });
    }
    if (widget.index != null && widget.index != _activeIndex) {
      _activeIndex = widget.index!;
    }
  }

  void _onIndexChanged(int index) {
    setState(() {
      _activeIndex = index;
    });
    if (widget.onIndexChanged != null) {
      widget.onIndexChanged!(index);
    }
  }

  Widget _buildSwiper() {
    IndexedWidgetBuilder itemBuilder;
    if (widget.onTap != null) {
      itemBuilder = _wrapTap;
    } else {
      itemBuilder = widget.itemBuilder;
    }

    if (widget.layout == SwiperLayout.STACK) {
      return _StackSwiper(
        loop: widget.loop,
        itemWidth: widget.itemWidth,
        itemHeight: widget.itemHeight,
        itemCount: widget.itemCount,
        itemBuilder: itemBuilder,
        index: _activeIndex,
        curve: widget.curve,
        onIndexChanged: _onIndexChanged,
        controller: _controller!,
        scrollDirection: widget.scrollDirection,
      );
    }
    return Container();
  }

  SwiperPluginConfig _ensureConfig(SwiperPluginConfig? config) {
    config ??= SwiperPluginConfig(
        outer: widget.outer,
        itemCount: widget.itemCount,
        layout: widget.layout,
        indicatorLayout: widget.indicatorLayout,
        pageController: _pageController,
        activeIndex: _activeIndex,
        scrollDirection: widget.scrollDirection,
        controller: _controller!,
        loop: widget.loop);
    return config;
  }

  List<Widget> _ensureListForStack(
      Widget swiper, List<Widget>? listForStack, Widget widget) {
    if (listForStack == null) {
      listForStack = [swiper, widget];
    } else {
      listForStack.add(widget);
    }
    return listForStack;
  }

  @override
  Widget build(BuildContext context) {
    Widget swiper = _buildSwiper();
    List<Widget>? listForStack;
    SwiperPluginConfig? config;
    if (widget.control != null) {
      //Stack
      config = _ensureConfig(config);
      listForStack = _ensureListForStack(
          swiper, listForStack, widget.control!.build(context, config));
    }

    if (widget.plugins != null) {
      config = _ensureConfig(config);
      for (SwiperPlugin plugin in widget.plugins!) {
        listForStack = _ensureListForStack(
            swiper, listForStack, plugin.build(context, config));
      }
    }

    if (listForStack != null) {
      return Stack(
        children: listForStack,
      );
    }

    return swiper;
  }
}

abstract class _SubSwiper extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final int? index;
  final ValueChanged<int>? onIndexChanged;
  final SwiperController controller;
  final int duration;
  final Curve curve;
  final double itemWidth;
  final double itemHeight;
  final bool loop;
  final Axis? scrollDirection;

  const _SubSwiper(
      {Key? key,
      this.loop = false,
      this.itemHeight = double.infinity,
      this.itemWidth = double.infinity,
      this.duration = 0,
      this.curve = Curves.linear,
      required this.itemBuilder,
      required this.controller,
      this.index,
      this.itemCount = 0,
      this.scrollDirection = Axis.horizontal,
      this.onIndexChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState();

  int getCorrectIndex(int indexNeedsFix) {
    if (itemCount == 0) return 0;
    int value = indexNeedsFix % itemCount;
    if (value < 0) {
      value += itemCount;
    }
    return value;
  }
}

class _StackSwiper extends _SubSwiper {
  const _StackSwiper({
    Key? key,
    Curve curve = Curves.linear,
    int duration = 0,
    required SwiperController controller,
    ValueChanged<int>? onIndexChanged,
    double itemHeight = 0,
    double itemWidth = 0,
    required IndexedWidgetBuilder itemBuilder,
    int index = 0,
    bool loop = false,
    int itemCount = 0,
    Axis? scrollDirection,
  }) : super(
            loop: loop,
            key: key,
            itemWidth: itemWidth,
            itemHeight: itemHeight,
            itemBuilder: itemBuilder,
            curve: curve,
            duration: duration,
            controller: controller,
            index: index,
            onIndexChanged: onIndexChanged,
            itemCount: itemCount,
            scrollDirection: scrollDirection);

  @override
  State<StatefulWidget> createState() {
    return _StackViewState();
  }
}

class _StackViewState extends _CustomLayoutStateBase<_StackSwiper> {
  late List<double> scales;
  late List<double> offsets;
  late List<double> opacity;
  late List<double> shadowOpacity;

  void _updateValues() {
    double space = (_swiperWidth - widget.itemWidth) / 2 + 40;
    offsets = [
      _swiperWidth,
      0.0,
      -space / 3,
      -space / 3 * 2,
      -space,
    ];
  }

  @override
  void didUpdateWidget(_StackSwiper oldWidget) {
    _updateValues();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void afterRender() {
    super.afterRender();

    //length of the values array below
    _animationCount = 5;

    //Array below this line, '0' index is 1.0 ,witch is the first item show in swiper.
    _startIndex = -1;
    scales = [0.6, 1.0, 0.85, 0.7, 0.7];
    opacity = [0.6, 1.0, 0.6, 0.5, 0.0];
    shadowOpacity = [0.0, 0.4, 0.0, 0.0, 0.0];

    _updateValues();
  }

  @override
  Widget _buildItem(int i, int realIndex, double animationValue) {
    double s = _getValue(scales, animationValue, i);
    double f = _getValue(offsets, animationValue, i);
    double o = _getValue(opacity, animationValue, i);
    double so = _getValue(shadowOpacity, animationValue, i);

    Offset offset = Offset(-f, 0.0);
    return Align(
      alignment: Alignment.centerLeft,
      child: Opacity(
        opacity: o,
        child: Transform.translate(
          key: ValueKey<int>(realIndex),
          offset: offset,
          child: Transform.scale(
            scale: s,
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: widget.itemWidth,
              height: widget.itemHeight,
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(so),
                        blurRadius: 20,
                        offset: const Offset(8, 10),
                      )
                    ],
                  ),
                  child: widget.itemBuilder(context, realIndex),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
