import 'package:e_learning_app/bases/presentation/atoms/default_app_bar.dart';
import 'package:e_learning_app/bases/presentation/atoms/skeleton.dart';
import 'package:e_learning_app/core/factory/search/search_detaiL_factory.dart';
import 'package:e_learning_app/features/search_detail/search_detail_presenter.dart';
import 'package:e_learning_app/features/search_detail/search_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'search_presenter.dart';
import 'widgets/w_grid_teacher_item.dart';
import 'widgets/w_search_input.dart';
import 'widgets/w_tag_list.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> with WidgetsBindingObserver {
  late final SearchPresenter presenter;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    presenter = context.read<SearchPresenter>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      presenter.fetchSearchLocal();
      presenter.fetchTeachers();
    });
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
    return SearchScreen(
      presenter: presenter,
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
    required this.presenter,
  });

  final SearchPresenter presenter;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  void navigateToDetail(String keyword) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiProvider(
          providers: [
            ChangeNotifierProvider<SearchDetailPresenter>(
              create: (_) => makeSearchDetailPresenter(),
              lazy: true,
            ),
            ChangeNotifierProvider<SearchPresenter>.value(
              value: widget.presenter,
            ),
          ],
          builder: (_, __) => SearchDetailView(
            initKeyword: keyword,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Search'),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Selector<SearchPresenter, bool>(
                  selector: (_, presenter) => presenter.isShowClearButton,
                  builder: (context, isShowClearButton, _) => SearchInput(
                    searchController: widget.presenter.searchController,
                    onChanged: widget.presenter.onKeywordChanged,
                    onSearch: (keyword) async {
                      await widget.presenter.handleSearch(keyword);
                      navigateToDetail(keyword);
                    },
                    isShowButton: widget.presenter.isShowClearButton,
                    onClearButton: widget.presenter.handleClearButton,
                    onSubmitSearch: (keyword) async {
                      await widget.presenter.handleSearch(keyword);
                      navigateToDetail(keyword);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Selector<SearchPresenter, int>(
                  selector: (_, presenter) => presenter.historySearch.length,
                  builder: (_, __, ___) {
                    print(widget.presenter.historySearch.toString());

                    return Align(
                      alignment: Alignment.centerLeft,
                      child: TagList(
                        spacing: 12,
                        paddingWrap: const EdgeInsets.symmetric(horizontal: 20),
                        onTagTap: navigateToDetail,
                        tags: widget.presenter.historySearch,
                        title: 'Recently search',
                      ),
                    );
                  }),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Search by teacher',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Selector<SearchPresenter, bool>(
                    selector: (_, presenter) => presenter.isTeacherLoading,
                    builder: (_, isTeacherLoading, __) {
                      if (isTeacherLoading) {
                        return GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 3,
                          children: const [
                            Skeleton(height: 60),
                            Skeleton(height: 60),
                          ],
                        );
                      }
                      return GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 3,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        primary: false,
                        children: widget.presenter.teachers
                            .map(
                              (teacher) => WGridTeacherItem(
                                teacher: teacher,
                                onItemTap: (teacher) {
                                  /// TODO: Handle navigate when tap on teacher
                                },
                              ),
                            )
                            .toList(),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
