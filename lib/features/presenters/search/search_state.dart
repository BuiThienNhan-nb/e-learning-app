import 'package:flutter/material.dart';

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

  SearchState({
    required this.selectedGenreIndex,
    required this.scrollController,
    required this.isShowClearButton,
    required this.searchController,
    required this.searchHistory,
    required this.errorMessage,
    required this.searchKey,
    required this.channelErrorMessage,
    required this.isChannelLoading,
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
    );
  }
}
