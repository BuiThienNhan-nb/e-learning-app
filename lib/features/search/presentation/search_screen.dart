import 'dart:developer';

import 'package:e_learning_app/bases/presentation/atoms/default_app_bar.dart';
import 'package:e_learning_app/features/auth/sign_in/domain/entities/teacher_model.dart';
import 'package:e_learning_app/utils/mock/mock_teachers.dart';
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
    presenter.fetchSearchLocal();
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
  final List<TeacherModel> dummyTeachers = MockTeachers().topTeachers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Search'),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Selector<SearchPresenter, bool>(
                selector: (_, presenter) => presenter.isShowClearButton,
                builder: (context, isShowClearButton, _) => SearchInput(
                  searchController: widget.presenter.searchController,
                  onChanged: widget.presenter.onKeywordChanged,
                  onSearch: widget.presenter.handleSearch,
                  isShowButton: widget.presenter.isShowClearButton,
                  onClearButton: widget.presenter.handleClearButton,
                  onSubmitSearch: widget.presenter.handleSearch,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Selector<SearchPresenter, int>(
                selector: (_, presenter) => presenter.historySearch.length,
                builder: (_, __, ___) {
                  log(widget.presenter.historySearch.toString());

                  return Align(
                    alignment: Alignment.centerLeft,
                    child: TagList(
                      spacing: 12,
                      paddingWrap: const EdgeInsets.symmetric(horizontal: 20),
                      onTagTap: (keyword) {
                        /// TODO: Handle navigate to search result
                      },
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
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: dummyTeachers
                    .map(
                      (teacher) => WGridTeacherItem(
                        teacher: teacher,
                        onItemTap: (teacher) {
                          /// TODO: Handle navigate when tap on teacher
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
