import 'package:flutter/material.dart';
import 'package:carousel_list/carousel_list.dart';

import 'config.dart';

class ExampleCustom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleCustomState();
  }
}

class _ExampleCustomState extends State<ExampleCustom> {
  //properties want to custom

  bool _loop = false;

  // bool _outer = false;

  double _radius = 0;

  double _viewportFraction = 0;

  int _currentIndex = 0;

  late double _scale;

  late Curve _curve;

  late double _fade;

  // late CustomLayoutOption customLayoutOption;

  Widget _buildItem(BuildContext context, int index) {
    return Stack(
      children: [
        SizedBox(
          width: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(_radius)),
            child: Image.asset(
              images[index],
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Item ${index}',
            style: const TextStyle(
                fontSize: 24, color: Colors.red, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    _fade = 1.0;
    _currentIndex = 0;
    _curve = Curves.ease;
    _scale = 0.8;
    _controller = SwiperController();
    _radius = 10.0;
    _loop = true;
    _viewportFraction = 0.8;
    // _outer = false;
    super.initState();
  }

// maintain the index

  Widget buildSwiper() {
    return Swiper(
      // onTap: (int index) {
      //   Navigator.of(context)
      //       .push(new MaterialPageRoute(builder: (BuildContext context) {
      //     return Scaffold(
      //       appBar: AppBar(
      //         title: Text("New page"),
      //       ),
      //       body: Container(),
      //     );
      //   }));
      // },
      // customLayoutOption: customLayoutOption,
      fade: _fade,
      index: _currentIndex,
      onIndexChanged: (int index) {
        // setState(() {
        //   _currentIndex = index;
        // });
      },
      curve: _curve,
      scale: _scale,
      itemWidth: 200,
      controller: _controller,
      layout: SwiperLayout.STACK,
      outer: true,
      itemHeight: 200.0,
      viewportFraction: _viewportFraction,
      loop: _loop,
      itemBuilder: _buildItem,
      itemCount: 4,
      scrollDirection: Axis.horizontal,
    );
  }

  late SwiperController _controller;
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child:
          SizedBox(height: 300.0, width: double.infinity, child: buildSwiper()),
    );
  }
}
