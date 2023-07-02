import 'package:e_learning_app/features/presenters/search/search_state.dart';
import 'package:e_learning_app/features/search/domain/repositories/fetch_search_history.dart';
import 'package:e_learning_app/features/search/domain/repositories/save_search_history.dart';
import 'package:e_learning_app/features/search/presentation/search_presenter.dart';
import 'package:flutter/material.dart';

class ProviderSearchPresenter with ChangeNotifier implements SearchPresenter {
  SearchState _state;
  final FetchSearchHistory _fetchSearchHistory;
  final SaveSearchHistory _saveSearchHistory;

  ProviderSearchPresenter(
    this._state,
    this._fetchSearchHistory,
    this._saveSearchHistory,
  );

  @override
  String? get errorMessage => _state.errorMessage;

  @override
  void fetchSearchLocal() {
    List<String> searchHistory = [];
    try {
      searchHistory = _fetchSearchHistory.call();
      _state = _state.copyWith(
        searchHistory: searchHistory,
      );
    } catch (e) {
      _state = _state.copyWith(errorMessage: e.toString());
    } finally {
      notifyListeners();
    }
  }

  @override
  void handleClearButton() {
    _state = _state.copyWith(isShowClearButton: false);
    _state.searchController.clear();
    notifyListeners();
  }

  @override
  Future<void> handleSearch(String searchKey) async {
    if (searchKey.isEmpty || searchKey.trim().isEmpty) {
      _state = _state.copyWith(isShowClearButton: false);
      _state.searchController.clear();
      notifyListeners();
      return;
    }
    await _onSaveSearch(searchKey.trim());
    _state.searchController.text = searchKey.trim();
    notifyListeners();
  }

  Future<void> _onSaveSearch(String searchKey) async {
    if (_state.searchHistory.contains(searchKey)) return;

    final listHistory = _state.searchHistory..insert(0, searchKey);
    try {
      await _saveSearchHistory(listHistory);
      _state = _state.copyWith(searchHistory: listHistory);
    } catch (e) {
      _state = _state.copyWith(errorMessage: e.toString());
    } finally {
      notifyListeners();
    }
  }

  @override
  void handleTagTap(int selectIndex) {
    // TODO: implement handleTagTap
  }

  @override
  List<String> get historySearch => _state.searchHistory;

  @override
  bool get isShowClearButton => _state.isShowClearButton;

  @override
  void onKeywordChanged(String text) {
    _state = _state.copyWith(searchKey: text);

    /// reduce number of notifyListeners() call times
    if (text.isNotEmpty && !isShowClearButton) {
      _state = _state.copyWith(isShowClearButton: true);
      notifyListeners();
    } else if (text.isEmpty && isShowClearButton) {
      _state = _state.copyWith(isShowClearButton: false);
      notifyListeners();
    }
  }

  @override
  ScrollController get scrollController => _state.scrollController;

  @override
  TextEditingController get searchController => _state.searchController;

  @override
  String? get searchKey => _state.searchKey;
}
