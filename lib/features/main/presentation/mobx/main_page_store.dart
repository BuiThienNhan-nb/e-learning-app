import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'main_page_store.g.dart';

@injectable
class MainPageStore extends _MainPageStore with _$MainPageStore {}

abstract class _MainPageStore with Store {
  @observable
  int pageIndex = 0;

  @action
  void onPageChanged(int value, BuildContext context, String url) {
    pageIndex = value;
    GoRouter.of(context).go(url);
  }
}
