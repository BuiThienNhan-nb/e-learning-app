import 'package:flutter/material.dart';
import 'package:carousel_list/carousel_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InnerSwiper(),
    );
  }
}

class InnerSwiper extends StatefulWidget {
  const InnerSwiper({super.key});

  @override
  State<StatefulWidget> createState() {
    return _InnerSwiperState();
  }
}

class _InnerSwiperState extends State<InnerSwiper> {
  late SwiperController controller;

  late List<bool> autoplayes;

  late List<SwiperController> controllers;

  @override
  void initState() {
    controller = SwiperController();
    autoplayes = List.empty(growable: true)
      ..length = 10
      ..fillRange(0, 10, false);
    controllers = List.empty(growable: true)
      ..length = 10
      ..fillRange(0, 10, SwiperController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swiper(
        loop: false,
        itemCount: 10,
        controller: controller,
        pagination: const SwiperPagination(),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: 300.0,
                child: Swiper(
                  controller: controllers[index],
                  pagination: const SwiperPagination(),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Colors.greenAccent,
                      child: const Text("jkfjkldsfjd"),
                    );
                  },
                  // autoplay: autoplayes[index],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    autoplayes[index] = true;
                  });
                },
                child: const Text("Start autoplay"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    autoplayes[index] = false;
                  });
                },
                child: const Text("End autoplay"),
              ),
              Text("is autoplay: ${autoplayes[index]}")
            ],
          );
        },
      ),
    );
  }
}
