part of 'swiper.dart';

const animationDuration = 750;

abstract class _CustomLayoutStateBase<T extends _SubSwiper> extends State<T>
    with SingleTickerProviderStateMixin {
  double _swiperWidth = double.infinity;

  // double _swiperHeight = double.infinity;
  Animation<double>? _animation;
  late AnimationController _animationController;
  int? _startIndex;
  int? _animationCount;

  @override
  void initState() {
    if (widget.itemWidth == null) {
      throw Exception(
          "==============\n\nwidget.itemWith must not be null when use stack layout.\n========\n");
    }

    _createAnimationController();
    widget.controller.addListener(_onController);
    super.initState();
  }

  void _createAnimationController() {
    _animationController = AnimationController(vsync: this, value: 0.5);
    Tween<double> tween = Tween(begin: 0.0, end: 1.0);
    _animation = tween.animate(_animationController);
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(_getSize);
    super.didChangeDependencies();
  }

  void _getSize(_) {
    afterRender();
  }

  @mustCallSuper
  void afterRender() {
    RenderObject? renderObject = context.findRenderObject();
    Size? size = renderObject?.paintBounds.size;
    if (size != null) {
      _swiperWidth = size.width;
      // _swiperHeight = size.height;
    }
    setState(() {});
  }

  @override
  void didUpdateWidget(T oldWidget) {
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller.removeListener(_onController);
      widget.controller.addListener(_onController);
    }

    if (widget.loop != oldWidget.loop) {
      if (!widget.loop) {
        _currentIndex = _ensureIndex(_currentIndex);
      }
    }

    super.didUpdateWidget(oldWidget);
  }

  int _ensureIndex(int index) {
    index = index % widget.itemCount;
    if (index < 0) {
      index += widget.itemCount;
    }
    return index;
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onController);
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildItem(int i, int realIndex, double animationValue);

  Widget _buildContainer(List<Widget> list) {
    return Stack(
      children: list,
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? w) {
    List<Widget> list = [];
    //
    // 0 + 4 + -1 = 3
    // 0 + 3 + -1 = 2
    // 0 + 2 + -1 = 1
    // 0 + 1 + -1 = 0
    // 0 + 0 + -1 = -1 + 4 => 3
    //
    // 1 + 4 + -1 = 4
    // 1 + 3 + -1 = 3
    // 1 + 2 + -1 = 2
    // 1 + 1 + -1 = 1
    // 1 + 0 + -1 = 0

    if (_animationCount != null) {
      double? animationValue = _animation?.value;
      for (int i = _animationCount! - 1; i >= 0; i--) {
        int realIndex = _currentIndex + i + (-1 ?? 0);
        realIndex = realIndex % widget.itemCount;
        if (realIndex < 0) {
          realIndex += widget.itemCount;
        }
        if (animationValue != null) {
          list.add(_buildItem(i, realIndex, animationValue));
        }
      }
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanStart: _onPanStart,
      onPanEnd: _onPanEnd,
      onPanUpdate: _onPanUpdate,
      child: ClipRect(
        child: Center(
          child: _buildContainer(list),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_animationCount == null) {
      return Container();
    }
    return AnimatedBuilder(
        animation: _animationController, builder: _buildAnimation);
  }

  double? _currentValue;
  double? _currentPos;

  bool _lockScroll = false;

  void _move(double position, {int? nextIndex}) async {
    if (_lockScroll) return;
    try {
      _lockScroll = true;
      if (nextIndex != null && widget.onIndexChanged != null) {
        widget.onIndexChanged!(widget.getCorrectIndex(nextIndex));
      }
      await _animationController.animateTo(position,
          duration: const Duration(milliseconds: animationDuration),
          curve: widget.curve);
    } catch (e) {
      print(e);
    } finally {
      if (nextIndex != null) {
        try {
          _animationController.value = 0.5;
        } catch (e) {
          print(e);
        }

        _currentIndex = nextIndex;
      }
      _lockScroll = false;
    }
  }

  int _nextIndex() {
    int index = _currentIndex + 1;
    if (!widget.loop && index >= widget.itemCount - 1) {
      return widget.itemCount - 1;
    }
    return index;
  }

  int _prevIndex() {
    int index = _currentIndex - 1;
    if (!widget.loop && index < 0) {
      return 0;
    }
    return index;
  }

  void _onController() {
    switch (widget.controller.event) {
      case IndexController.PREVIOUS:
        int prevIndex = _prevIndex();
        if (prevIndex == _currentIndex) return;
        _move(1.0, nextIndex: prevIndex);
        break;
      case IndexController.NEXT:
        int nextIndex = _nextIndex();
        if (nextIndex == _currentIndex) return;
        _move(0.0, nextIndex: nextIndex);
        break;
      case IndexController.MOVE:
        throw Exception(
            "Custom layout does not support SwiperControllerEvent.MOVE_INDEX yet!");
      case SwiperController.STOP_AUTOPLAY:
      case SwiperController.START_AUTOPLAY:
        break;
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (_lockScroll) return;

    double velocity = details.velocity.pixelsPerSecond.dx;
    if ((_animationController.value >= 0.75) || velocity > 500.0) {
      if (_currentIndex <= 0 && !widget.loop) {
        return;
      }

      _move(1.0, nextIndex: _currentIndex - 1);
    } else if ((_animationController.value < 0.25) || velocity < -500.0) {
      if (_currentIndex >= widget.itemCount - 1 && !widget.loop) {
        return;
      }
      _move(0.0, nextIndex: _currentIndex + 1);
    } else {
      _move(0.5);
    }
  }

  void _onPanStart(DragStartDetails details) {
    if (_lockScroll) return;
    _currentValue = _animationController.value;
    _currentPos = details.globalPosition.dx;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (_lockScroll) return;
    double value = _currentValue ?? details.globalPosition.dx;
    // no loop ?
    if (!widget.loop) {
      if (_currentIndex >= widget.itemCount - 1) {
        if (value < 0.5) {
          value = 0.5;
        }
      } else if (_currentIndex <= 0) {
        if (value > 0.5) {
          value = 0.5;
        }
      }
    }
    _animationController.value = value;
  }

  int _currentIndex = 0;
}

double _getValue(List<double> values, double animationValue, int index) {
  double s = values[index]; // 0.0
  if (animationValue >= 0.5) {
    if (index < values.length - 1) {
      s = s + (values[index + 1] - s) * (animationValue - 0.5) * 2.0;
    }
  } else {
    if (index != 0) {
      s = s - (s - values[index - 1]) * (0.5 - animationValue) * 2.0;
    }
  }
  return s;
}
