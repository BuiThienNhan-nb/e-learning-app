import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/app/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = GetIt.I<AppProvider>();

    log("Current user: ${appProvider.user}");
    return const Scaffold(
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
