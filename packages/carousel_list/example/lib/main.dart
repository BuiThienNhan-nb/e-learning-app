import 'package:flutter/material.dart';

import 'src/ExampleCustom.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScaffoldWidget(
        title: "Custom All",
        child: ExampleCustom(),
      ),
      //home: buildHome(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> render(BuildContext context, List children) {
    return ListTile.divideTiles(
        context: context,
        tiles: children.map((dynamic data) {
          return buildListTile(context, data[0], data[1], data[2]);
        })).toList();
  }

  Widget buildListTile(
      BuildContext context, String title, String subtitle, String url) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(url);
      },
      isThreeLine: true,
      dense: false,
      leading: null,
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(
        Icons.arrow_right,
        color: Colors.blueAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // DateTime moonLanding = DateTime.parse("1969-07-20");

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: ListView(
        children: render(context, [
          ["Horizontal", "Scroll Horizontal", "/example01"],
          ["Vertical", "Scroll Vertical", "/example02"],
          ["Fraction", "Fraction style", "/example03"],
          ["Custom Pagination", "Custom Pagination", "/example04"],
          ["Phone", "Phone view", "/example05"],
          ["ScrollView ", "In a ScrollView", "/example06"],
          ["Custom", "Custom all properties", "/example07"]
        ]),
      ),
    );
  }
}

const List<String> titles = [
  "Flutter Swiper is awosome",
  "Really nice",
  "Yeap"
];

class ScaffoldWidget extends StatelessWidget {
  final Widget? child;
  final String? title;
  final List<Widget>? actions;

  const ScaffoldWidget({super.key, this.child, this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ''),
        actions: actions,
      ),
      body: child,
    );
  }
}
