// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dartz/dartz.dart' as darzt;
import 'package:e_learning_app/core/error/failures.dart';
import 'package:e_learning_app/core/usecases/base_use_case.dart';
import 'package:e_learning_app/features/home/domain/usecases/lesson_use_cases/get_rcm_courses_use_case.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';
import 'package:flutter/widgets.dart';

import 'package:e_learning_app/features/presenters/top/top_state.dart';
import 'package:e_learning_app/features/top/domain/entities/visual_model.dart';
import 'package:e_learning_app/features/top/presentation/top_presenter.dart';

import '../../../utils/app_utils.dart';

class ProviderTopPresenter with ChangeNotifier implements TopPresenter {
  TopState _state;
  final GetRecommendedCoursesUseCase _getRcmCourses;

  ProviderTopPresenter(
    this._state,
    this._getRcmCourses,
  );

  @override
  int get beforeRankingIndex => _state.rankingIndex;

  @override
  Future<void> fetchContinueToWatchCourses() {
    throw UnimplementedError();
  }

  @override
  Future<void> fetchFrees() {
    throw UnimplementedError();
  }

  @override
  Future<void> fetchHighlightedCourses() {
    throw UnimplementedError();
  }

  @override
  Future<void> fetchMissedCourses() {
    throw UnimplementedError();
  }

  @override
  Future<void> fetchRankingCourses() {
    return _fetchCoursesByType(CoursesType.recommend);
  }

  Future<void> _fetchCoursesByType(CoursesType type) async {
    final key = type.name;
    final loadingMap = _state.isListLoading;
    final coursesMap = _state.coursesMap;
    final errorMap = _state.listErrorMessage;
    darzt.Either<Failure, List<CourseModel>> data;

    if (loadingMap[key] != true) {
      loadingMap[key] = true;
      notifyListeners();
    }
    if (errorMap[key] != null && errorMap[key]!.isNotEmpty) {
      errorMap[key] = '';
      notifyListeners();
    }

    try {
      switch (type) {
        case CoursesType.recommend:
          data = await _getRcmCourses(NoParams());
          break;
        default:
          throw UnimplementedError();
      }
      data.fold(
        (l) {
          errorMap[key] = l.message.toString();
          _state = _state.copyWith(listErrorMessage: errorMap);
        },
        (r) {
          coursesMap[key] = r;
          print('provider_top_presenter - getRcmCourses: $r');
          _state = _state.copyWith(coursesMap: coursesMap);
        },
      );
    } catch (e) {
      errorMap[key] = e.toString();
      _state = _state.copyWith(listErrorMessage: errorMap);
    } finally {
      loadingMap[key] = false;
      _state = _state.copyWith(isListLoading: loadingMap);
      notifyListeners();
    }
  }

  @override
  Future<void> fetchRecommendedVisual() {
    throw UnimplementedError();
  }

  @override
  Map<String, String> get getErrorsMap => _state.listErrorMessage;

  @override
  String? getListErrorMsg(String key) {
    return _state.listErrorMessage[key];
  }

  @override
  TopNavigation? get goTo => throw UnimplementedError();

  @override
  Future<bool> handleInnerPop() {
    throw UnimplementedError();
  }

  @override
  void initDimension(
      BuildContext context, GlobalKey<State<StatefulWidget>> widgetKey) {
    final statusBarH = Utils.instance.getStatusBarHeight(context);
    _state = _state.copyWith(
      statusBarHeight: statusBarH,
      listGenreHeight: Utils.instance.getWidgetSize(widgetKey)?.height ?? 0,
      listGenreThreshold:
          (Utils.instance.getWidgetOffset(widgetKey)?.dy ?? 0) - statusBarH,
    );
    notifyListeners();
  }

  @override
  void initPage() async {
    if (_state.scrollController.positions.isNotEmpty) {
      _state.scrollController.jumpTo(0);
    }
    _state.scrollController.addListener(_scrollOffsetListener);
    await Future.wait([
      _callApi(),
      fetchRankingCourses(),
    ]);
  }

  void _scrollOffsetListener() {
    if (_state.scrollController.offset >= _state.listGenreThreshold) {
      if (!_state.isShowAppBar) {
        _state = _state.copyWith(isShowAppBar: true);
        notifyListeners();
      }
    } else if (_state.scrollController.offset < _state.listGenreThreshold) {
      if (_state.isShowAppBar) {
        _state = _state.copyWith(isShowAppBar: false);
        notifyListeners();
      }
    }
    notifyListeners();
  }

  Future<void> _callApi() async {
    _fakeCallApi(1);
  }

  void _fakeCallApi(int seconds) {
    if (!_state.isPageLoading) {
      _state = _state.copyWith(isPageLoading: true);
      notifyListeners();
    }
    Future.delayed(Duration(seconds: seconds)).then(
      (value) {
        _state = _state.copyWith(
          visuals: [
            const VisualModel(
              courseId: 'courseId-1',
              imageUrl:
                  'https://images.unsplash.com/photo-1555432783-9aed44ab60a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
            ),
            const VisualModel(
              courseId: 'courseId-2',
              imageUrl:
                  'https://images.unsplash.com/photo-1586880244406-556ebe35f282?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
            ),
            const VisualModel(
              courseId: 'courseId-3',
              imageUrl:
                  'https://images.unsplash.com/photo-1677694029513-f276cd328f66?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=435&q=80',
            ),
            const VisualModel(
              courseId: 'courseId-4',
              imageUrl:
                  'https://images.unsplash.com/photo-1637315684599-94592c985e2b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
            ),
            const VisualModel(
              courseId: 'courseId-5',
              imageUrl:
                  'https://images.unsplash.com/photo-1606143986926-83f7897591df?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
            ),
          ],
          isPageLoading: false,
        );
        notifyListeners();
      },
    );
  }

  @override
  bool isListLoading(String key) => _state.isListLoading[key]!;

  @override
  bool get isPageLoading => _state.isPageLoading;

  @override
  bool get isShowAppBar => _state.isShowAppBar;

  @override
  bool get isVisualLoading => _state.isVisualLoading;

  @override
  String? get keyVisualErrorMsg => '';

  @override
  double get listGenreHeight => _state.listGenreHeight;

  @override
  int get rankingIndex => _state.rankingIndex;

  @override
  ScrollController get scrollController => _state.scrollController;

  @override
  Future<void> setListCoursesLoading(
      bool isLoading, CoursesType coursesType) async {
    final map = _state.isListLoading;
    map[coursesType.name] = isLoading;
    _state = _state.copyWith(isListLoading: map);
    notifyListeners();
  }

  @override
  double get statusBarHeight => _state.statusBarHeight;

  @override
  void updateRankingIndex(int index) {
    final rankIdx = _state.rankingIndex;
    _state = _state.copyWith(
      beforeRankingIndex: rankIdx,
      rankingIndex: index,
    );
    notifyListeners();
  }

  @override
  PageController get visualController => _state.visualController;

  @override
  List<VisualModel> get visuals => _state.visuals;
}
