import 'package:e_learning_app/features/top/domain/entities/course_model.dart';
import 'package:e_learning_app/features/top/domain/entities/google_search_modal.dart';
import 'package:e_learning_app/features/top/domain/entities/visual_model.dart';
import 'package:flutter/material.dart';

import '../../presenters/top/top_state.dart';

abstract class TopPresenter implements ChangeNotifier {
  void initPage();
  void initDimension(BuildContext context, GlobalKey widgetKey);
  Future<bool> handleInnerPop();
  void setListCoursesLoading(
    bool isLoading,
    CoursesType coursesType,
  );
  Future<void> fetchRecommendedVisual();
  Future<void> fetchRankingCourses();
  Future<void> fetchLatestCourses();
  Future<void> fetchTopRateCourses();
  Future<void> fetchGoogleSearch();
  void updateRankingIndex(int index);

  bool get isPageLoading;
  bool get isShowAppBar;
  bool get isVisualLoading;
  double get listGenreHeight;
  double get statusBarHeight;
  int get beforeRankingIndex;
  ScrollController get scrollController;
  PageController get visualController;
  int get rankingIndex;
  TopNavigation? get goTo;
  bool isListLoading(String key);
  String? getListErrorMsg(String key);
  String? get keyVisualErrorMsg;
  Map<String, String> get getErrorsMap;
  List<VisualModel> get visuals;
  List<CourseModel> getListCoursesByType(String key);
  bool get isGoogleSearchLoading;
  List<GoogleSearchModel> get googleSearchResponses;
  String? get ggSearchErrorMsg;
}
