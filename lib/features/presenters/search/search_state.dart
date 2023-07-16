// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:e_learning_app/features/auth/sign_in/domain/entities/teacher_model.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';

class SearchState {
  final int selectedGenreIndex;
  final ScrollController scrollController;
  final bool isShowClearButton;
  final TextEditingController searchController;
  final String errorMessage;
  final String? searchKey;
  final List<String> searchHistory;
  final String? channelErrorMessage;
  final bool isChannelLoading;
  final bool isTeacherLoading;
  final List<TeacherModel> teachers;
  final String fetchTeacherErrorMsg;
  final bool isSearchLoading;
  final List<CourseModel> courses;
  final String searchErrorMsg;
  SearchState({
    required this.selectedGenreIndex,
    required this.scrollController,
    required this.isShowClearButton,
    required this.searchController,
    required this.errorMessage,
    this.searchKey,
    required this.searchHistory,
    this.channelErrorMessage,
    required this.isChannelLoading,
    required this.isTeacherLoading,
    required this.teachers,
    required this.fetchTeacherErrorMsg,
    required this.isSearchLoading,
    required this.courses,
    required this.searchErrorMsg,
  });

  // named constructor
  factory SearchState.initial() {
    return SearchState(
      selectedGenreIndex: 0,
      scrollController: ScrollController(),
      isShowClearButton: false,
      searchController: TextEditingController(),
      errorMessage: '',
      searchKey: null,
      searchHistory: [],
      channelErrorMessage: null,
      isChannelLoading: true,
      fetchTeacherErrorMsg: '',
      isTeacherLoading: true,
      teachers: [],
      courses: [],
      isSearchLoading: true,
      searchErrorMsg: '',
    );
  }

  SearchState copyWith({
    int? selectedGenreIndex,
    ScrollController? scrollController,
    bool? isShowClearButton,
    TextEditingController? searchController,
    String? errorMessage,
    String? searchKey,
    List<String>? searchHistory,
    String? channelErrorMessage,
    bool? isChannelLoading,
    bool? isTeacherLoading,
    List<TeacherModel>? teachers,
    String? fetchTeacherErrorMsg,
    bool? isSearchLoading,
    List<CourseModel>? courses,
    String? searchErrorMsg,
  }) {
    return SearchState(
      selectedGenreIndex: selectedGenreIndex ?? this.selectedGenreIndex,
      scrollController: scrollController ?? this.scrollController,
      isShowClearButton: isShowClearButton ?? this.isShowClearButton,
      searchController: searchController ?? this.searchController,
      errorMessage: errorMessage ?? this.errorMessage,
      searchKey: searchKey ?? this.searchKey,
      searchHistory: searchHistory ?? this.searchHistory,
      channelErrorMessage: channelErrorMessage ?? this.channelErrorMessage,
      isChannelLoading: isChannelLoading ?? this.isChannelLoading,
      isTeacherLoading: isTeacherLoading ?? this.isTeacherLoading,
      teachers: teachers ?? this.teachers,
      fetchTeacherErrorMsg: fetchTeacherErrorMsg ?? this.fetchTeacherErrorMsg,
      isSearchLoading: isSearchLoading ?? this.isSearchLoading,
      courses: courses ?? this.courses,
      searchErrorMsg: searchErrorMsg ?? this.searchErrorMsg,
    );
  }
}
