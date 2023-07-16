import 'package:e_learning_app/core/usecases/base_use_case.dart';
import 'package:e_learning_app/features/auth/sign_in/domain/entities/teacher_model.dart';
import 'package:e_learning_app/features/home/domain/usecases/teacher_use_cases/get_top_teacher_use_case.dart';
import 'package:e_learning_app/features/presenters/search/search_state.dart';
import 'package:e_learning_app/features/search/domain/entities/search_result_query_params.dart';
import 'package:e_learning_app/features/search/domain/repositories/fetch_search_history.dart';
import 'package:e_learning_app/features/search/domain/repositories/fetch_search_result.dart';
import 'package:e_learning_app/features/search/domain/repositories/save_search_history.dart';
import 'package:e_learning_app/features/search/presentation/search_presenter.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';
import 'package:flutter/material.dart';

class ProviderSearchPresenter with ChangeNotifier implements SearchPresenter {
  SearchState _state;
  final FetchSearchHistory _fetchSearchHistory;
  final SaveSearchHistory _saveSearchHistory;
  final GetTopTeachersUseCase _fetchTeachers;
  final FetchSearchResult _fetchSearchResult;

  ProviderSearchPresenter(
    this._state,
    this._fetchSearchHistory,
    this._saveSearchHistory,
    this._fetchTeachers,
    this._fetchSearchResult,
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

  @override
  Future<void> search(String keyword) async {
    if (!_state.isSearchLoading) {
      _state = _state.copyWith(isSearchLoading: true);
      notifyListeners();
    }
    if (_state.searchErrorMsg.isNotEmpty) {
      _state = _state.copyWith(searchErrorMsg: '');
      notifyListeners();
    }

    try {
      final data = await _fetchSearchResult(
        SearchResultQueryParams(keyword: keyword),
      );
      data.fold(
        (l) => _state = _state.copyWith(searchErrorMsg: l.message),
        (r) => _state = _state.copyWith(courses: r),
      );
    } catch (e) {
      _state = _state.copyWith(searchErrorMsg: e.toString());
    } finally {
      _state = _state.copyWith(isSearchLoading: false);
      notifyListeners();
    }
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

  @override
  String? get fetchTeacherErrorMessage => _state.fetchTeacherErrorMsg;

  @override
  void fetchTeachers() async {
    if (!_state.isTeacherLoading) {
      _state = _state.copyWith(isTeacherLoading: true);
      notifyListeners();
    }
    if (_state.fetchTeacherErrorMsg.isNotEmpty) {
      _state = _state.copyWith(fetchTeacherErrorMsg: '');
      notifyListeners();
    }

    try {
      final data = await _fetchTeachers(NoParams());
      data.fold(
        (l) => _state = _state.copyWith(fetchTeacherErrorMsg: l.message),
        (r) => _state = _state.copyWith(teachers: r),
      );
    } catch (e) {
      _state = _state.copyWith(fetchTeacherErrorMsg: e.toString());
    } finally {
      _state = _state.copyWith(isTeacherLoading: false);
      notifyListeners();
    }
  }

  @override
  bool get isTeacherLoading => _state.isTeacherLoading;

  @override
  List<TeacherModel> get teachers => _state.teachers;

  @override
  List<CourseModel> get courses => _state.courses;

  @override
  String get searchErrorMsg => _state.searchErrorMsg;

  @override
  bool get searchLoading => _state.isSearchLoading;
}
