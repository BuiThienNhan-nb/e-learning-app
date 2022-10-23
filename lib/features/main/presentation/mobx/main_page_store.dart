import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';

import '../../../../bases/presentation/atoms/bottom_nav_bar.dart';

part 'main_page_store.g.dart';

class MainPageStore extends _MainPageStore with _$MainPageStore {}

abstract class _MainPageStore with Store {
  @observable
  int pageIndex = 0;

  @action
  void onPageChanged(int value, BuildContext context) {
    pageIndex = value;
    context.go(GetIt.I<BottomNavigationBarConfig>().mainPage[value]);
  }
}
