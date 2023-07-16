// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_learning_app/features/top/domain/entities/visual_model.dart';
import 'package:flutter/material.dart';

import '../../top/domain/entities/course_model.dart';

enum CoursesType {
  continueToWatch,
  hot,
  ranking,
  free,
  featured,
  isWatchingByOthers,
  recommend;

  static Map<String, bool> toLoadingMap() {
    final map = <String, bool>{};
    for (final eType in CoursesType.values) {
      map[eType.name] = true;
    }
    return map;
  }

  static Map<String, String> toErrorMsgMap() {
    final map = <String, String>{};
    for (final eType in CoursesType.values) {
      map[eType.name] = '';
    }
    return map;
  }

  static Map<String, List<CourseModel>> toCourseModelMap() {
    final map = <String, List<CourseModel>>{};
    for (final eType in CoursesType.values) {
      map[eType.name] = [];
    }
    return map;
  }

  @override
  String toString() {
    switch (this) {
      case CoursesType.ranking:
        return 'List Courses by Ranking';
      default:
        return 'List Courses';
    }
  }
}

enum TopNavigation {
  clearInnerStack,
}

class TopState {
  final double listGenreThreshold;
  final double listGenreHeight;
  final double statusBarHeight;
  final bool isShowAppBar;
  final int beforeRankingIndex;
  final int rankingIndex;
  final bool isVisualLoading;
  final ScrollController scrollController;
  final PageController visualController;
  final Map<String, bool> isListLoading;
  final Map<String, String> listErrorMessage;
  final bool isPageLoading;
  final List<VisualModel> visuals;
  final Map<String, List<CourseModel>> coursesMap;

  TopState({
    required this.listGenreThreshold,
    required this.listGenreHeight,
    required this.statusBarHeight,
    required this.isShowAppBar,
    required this.beforeRankingIndex,
    required this.rankingIndex,
    required this.isVisualLoading,
    required this.scrollController,
    required this.isListLoading,
    required this.listErrorMessage,
    required this.isPageLoading,
    required this.visualController,
    required this.visuals,
    required this.coursesMap,
  });

  factory TopState.initial() {
    return TopState(
      listGenreThreshold: 0,
      listGenreHeight: 0,
      statusBarHeight: 0,
      isShowAppBar: false,
      beforeRankingIndex: -1,
      rankingIndex: 0,
      isVisualLoading: true,
      scrollController: ScrollController(),
      isListLoading: CoursesType.toLoadingMap(),
      listErrorMessage: CoursesType.toErrorMsgMap(),
      isPageLoading: true,
      visualController: PageController(),
      visuals: [],
      coursesMap: CoursesType.toCourseModelMap(),
    );
  }

  TopState copyWith(
      {double? listGenreThreshold,
      double? listGenreHeight,
      double? statusBarHeight,
      bool? isShowAppBar,
      int? beforeRankingIndex,
      int? rankingIndex,
      bool? isVisualLoading,
      ScrollController? scrollController,
      Map<String, bool>? isListLoading,
      Map<String, String>? listErrorMessage,
      bool? isPageLoading,
      PageController? visualController,
      List<VisualModel>? visuals,
      Map<String, List<CourseModel>>? coursesMap}) {
    return TopState(
      listGenreThreshold: listGenreThreshold ?? this.listGenreThreshold,
      listGenreHeight: listGenreHeight ?? this.listGenreHeight,
      statusBarHeight: statusBarHeight ?? this.statusBarHeight,
      isShowAppBar: isShowAppBar ?? this.isShowAppBar,
      beforeRankingIndex: beforeRankingIndex ?? this.beforeRankingIndex,
      rankingIndex: rankingIndex ?? this.rankingIndex,
      isVisualLoading: isVisualLoading ?? this.isVisualLoading,
      scrollController: scrollController ?? this.scrollController,
      isListLoading: isListLoading ?? this.isListLoading,
      listErrorMessage: listErrorMessage ?? this.listErrorMessage,
      isPageLoading: isPageLoading ?? this.isPageLoading,
      visualController: visualController ?? this.visualController,
      visuals: visuals ?? this.visuals,
      coursesMap: coursesMap ?? this.coursesMap,
    );
  }
}
