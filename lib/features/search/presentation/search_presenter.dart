import 'package:flutter/material.dart';

abstract class SearchPresenter implements ChangeNotifier {
  List<String> get historySearch;
  ScrollController get scrollController;
  TextEditingController get searchController;
  bool get isShowClearButton;
  String? get errorMessage;
  String? get searchKey;

  void handleTagTap(int selectIndex);
  void onKeywordChanged(String text);
  Future<void> handleSearch(String text);
  void fetchSearchLocal();
  void handleClearButton();
}
