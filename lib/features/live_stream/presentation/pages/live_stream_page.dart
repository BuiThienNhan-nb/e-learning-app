import 'package:e_learning_app/bases/presentation/atoms/default_app_bar.dart';
import 'package:flutter/material.dart';

class LiveStreamPage extends StatelessWidget {
  const LiveStreamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(title: "Live Stream"),
      body: Center(
        child: Text("Live steaming section"),
      ),
    );
  }
}
