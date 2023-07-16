import 'package:e_learning_app/bases/presentation/atoms/default_app_bar.dart';
import 'package:e_learning_app/features/course_detail/presentation/states/course_detail_store.dart';
import 'package:e_learning_app/features/search/presentation/search_presenter.dart';
import 'package:e_learning_app/features/search/presentation/widgets/w_search_input.dart';
import 'package:e_learning_app/features/search_detail/search_detail_presenter.dart';
import 'package:e_learning_app/features/search_detail/widgets/w_episode.dart';
import 'package:e_learning_app/features/search_detail/widgets/w_vertical_list_loading.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../course_detail/presentation/pages/course_detail_page.dart';
import '../course_detail/presentation/states/course_rate_store.dart';

class SearchDetailView extends StatefulWidget {
  const SearchDetailView({
    super.key,
    required this.initKeyword,
  });

  final String initKeyword;

  @override
  State<SearchDetailView> createState() => _SearchDetailViewState();
}

class _SearchDetailViewState extends State<SearchDetailView>
    with WidgetsBindingObserver {
  late final SearchDetailPresenter presenter;
  late final SearchPresenter searchPresenter;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    presenter = context.read<SearchDetailPresenter>();
    // presenter.fetchSearchCourses(widget.initKeyword);
    searchPresenter = context.read<SearchPresenter>();
    searchPresenter.search(widget.initKeyword);
    presenter.addListener(_searchObserver);
    super.initState();
  }

  @override
  void dispose() {
    presenter.removeListener(_searchObserver);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _searchObserver() {}

  @override
  Widget build(BuildContext context) {
    return SearchDetailScreen(
      presenter: presenter,
      searchPresenter: searchPresenter,
    );
  }
}

class SearchDetailScreen extends StatelessWidget {
  const SearchDetailScreen({
    super.key,
    required this.presenter,
    required this.searchPresenter,
  });

  final SearchDetailPresenter presenter;
  final SearchPresenter searchPresenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Search Results'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Selector<SearchPresenter, bool>(
              selector: (_, presenter) => presenter.isShowClearButton,
              builder: (context, isShowClearButton, _) => SearchInput(
                searchController: searchPresenter.searchController,
                onChanged: searchPresenter.onKeywordChanged,
                onSearch: (keyword) async {
                  await searchPresenter.handleSearch(keyword);
                  await searchPresenter.search(keyword);
                },
                isShowButton: searchPresenter.isShowClearButton,
                onClearButton: searchPresenter.handleClearButton,
                onSubmitSearch: (keyword) async {
                  await searchPresenter.handleSearch(keyword);
                  await searchPresenter.search(keyword);
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Selector<SearchPresenter, bool>(
              selector: (_, presenter) => presenter.searchLoading,
              builder: (_, isLoading, __) => isLoading
                  ? const VerticalListEpisodesFullDateTimeLoading()
                  : ListView.builder(
                      itemCount: searchPresenter.courses.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (_, index) => WCourseItem(
                        course: searchPresenter.courses[index],
                        onCourseTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => MultiProvider(
                              providers: [
                                Provider<CourseDetailStore>(
                                  create: (_) => GetIt.I(),
                                  lazy: true,
                                ),
                                Provider<CourseRateStore>(
                                  create: (_) => GetIt.I(),
                                  lazy: true,
                                ),
                              ],
                              child: CourseDetailPage(
                                courseId: searchPresenter.courses[index].id,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
