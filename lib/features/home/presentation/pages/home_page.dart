import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.currentUrl,
  }) : super(key: key);

  final String currentUrl;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    final appProvider = GetIt.I<AppProvider>();

    log("Current user: ${appProvider.user}");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () => context
                .push('test-${widget.currentUrl.replaceAll(RegExp(r'/'), '')}'),
            child: const Text("Welcome to HomePage! Tap to go to next route"),
          ),
          Text("Current Count State: $count"),
          FloatingActionButton(
            onPressed: () => setState(
              () => count++,
            ),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
