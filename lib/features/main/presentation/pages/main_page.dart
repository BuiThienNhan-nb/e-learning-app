import 'package:flutter_mobx/flutter_mobx.dart';

import '../mobx/main_page_store.dart';
import '../widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final MainPageStore store = GetIt.I<MainPageStore>();

    return Observer(
      builder: (_) => Scaffold(
        appBar: store.pageIndex == 0 ? MainAppBar() : null,
        body: child,
        // bottomNavigationBar: BottomNavigationBar(
        //   items: const [],
        //   currentIndex: store.pageIndex,
        //   onTap: (tappedIndex) => store.onPageChanged(tappedIndex),
        // ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'A Screen',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'B Screen',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note),
              label: 'C Screen',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'D Screen',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'E Screen',
            ),
          ],
          currentIndex: store.pageIndex,
          onTap: (tappedIndex) => store.onPageChanged(tappedIndex, context),
        ),
      ),
    );
  }
}
