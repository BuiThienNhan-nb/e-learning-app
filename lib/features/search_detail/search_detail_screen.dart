import 'package:e_learning_app/bases/presentation/atoms/default_app_bar.dart';
import 'package:e_learning_app/features/search/presentation/search_presenter.dart';
import 'package:e_learning_app/features/search/presentation/widgets/w_search_input.dart';
import 'package:e_learning_app/features/search_detail/search_detail_presenter.dart';
import 'package:e_learning_app/features/search_detail/widgets/w_episode.dart';
import 'package:e_learning_app/features/search_detail/widgets/w_vertical_list_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    presenter = context.read<SearchDetailPresenter>();
    presenter.fetchSearchCourses(widget.initKeyword);
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
    );
  }
}

class SearchDetailScreen extends StatelessWidget {
  const SearchDetailScreen({
    super.key,
    required this.presenter,
  });

  final SearchDetailPresenter presenter;

  @override
  Widget build(BuildContext context) {
    final searchPresenter = context.read<SearchPresenter>();
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
                  await presenter.fetchSearchCourses(keyword);
                },
                isShowButton: searchPresenter.isShowClearButton,
                onClearButton: searchPresenter.handleClearButton,
                onSubmitSearch: (keyword) async {
                  await searchPresenter.handleSearch(keyword);
                  await presenter.fetchSearchCourses(keyword);
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Selector<SearchDetailPresenter, bool>(
              selector: (_, presenter) => presenter.isLoading,
              builder: (_, isLoading, __) => isLoading
                  ? const VerticalListEpisodesFullDateTimeLoading()
                  : ListView.builder(
                      itemCount: presenter.courses.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (_, index) => WCourseItem(
                        course: presenter.courses[index],
                        onCourseTap: () {},
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
