import 'package:e_learning_app/bases/presentation/atoms/skeleton.dart';
import 'package:e_learning_app/features/presenters/top/top_state.dart';
import 'package:e_learning_app/features/settings/presentation/pages/settings_page.dart';
import 'package:e_learning_app/features/top/domain/entities/google_search_modal.dart';
import 'package:e_learning_app/features/top/presentation/widgets/courses.dart';
import 'package:e_learning_app/features/top/presentation/widgets/ranking/ranking_content.dart';
import 'package:e_learning_app/features/top/presentation/widgets/top_gg_search_responses.dart';
import 'package:e_learning_app/utils/mock/mock_courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

import 'top_presenter.dart';
import 'widgets/genre_widget.dart';
import 'widgets/key_visual.dart';
import 'widgets/w_container_blur_gradient.dart';

class TopView extends StatefulWidget {
  const TopView({super.key});

  @override
  State<TopView> createState() => TopViewState();
}

class TopViewState extends State<TopView> with WidgetsBindingObserver {
  late final TopPresenter presenter;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    presenter = context.read<TopPresenter>();
    presenter.addListener(_topObserver);
    super.initState();
  }

  @override
  void dispose() {
    presenter.removeListener(_topObserver);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<bool> handleInnerPop() async => Navigator.of(context).maybePop();

  void _topObserver() {
    final topPresenter = context.read<TopPresenter>();
    // final goTo = topPresenter.goTo;
    // // final listErrors = topPresenter.getErrorsMap;
    // // final keyVisualErrors = topPresenter.keyVisualErrorMsg;

    // if (goTo == TopNavigation.clearInnerStack) {
    //   if (Navigator.of(context).canPop()) {
    //     Navigator.of(context).popUntil((route) => route.isFirst);
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return TopScreen(presenter: presenter);
  }
}

class TopScreen extends StatefulWidget {
  final TopPresenter presenter;

  const TopScreen({
    super.key,
    required this.presenter,
  });

  @override
  State<TopScreen> createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  final GlobalKey _listGenreKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    widget.presenter.initPage();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => widget.presenter.initDimension(context, _listGenreKey),
    );
  }

  void pushGoogleSearchWebview(GoogleSearchModel googleSearchModel) {
    final url = googleSearchModel.link;
    final MyInAppBrowser browser = MyInAppBrowser();
    final settings = InAppBrowserClassOptions(
      crossPlatform: InAppBrowserOptions(hideUrlBar: false),
      inAppWebViewGroupOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(javaScriptEnabled: true),
      ),
    );

    browser.openUrlRequest(
      urlRequest: URLRequest(
        url: Uri.parse(url),
      ),
      options: settings,
    );
  }

  @override
  Widget build(BuildContext context) {
    const spacing = 14.0;
    // final topPresenter = context.read<TopPresenter>();

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          widget.presenter.initPage();
        },
        child: Selector<TopPresenter, bool>(
            selector: (_, presenter) => presenter.isShowAppBar,
            builder: (context, isShowAppBar, _) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    controller: widget.presenter.scrollController,
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WContainerBlurGradient(
                          height: 675,
                          topWidget: Selector<TopPresenter, bool>(
                            selector: (_, notifier) => notifier.isPageLoading,
                            builder: (context, isKeyVisualLoading, _) =>
                                isKeyVisualLoading
                                    ? const KeyVisualLoading()
                                    : KeyVisual(
                                        imageUrls: widget.presenter.visuals
                                            .map((visual) => visual.imageUrl)
                                            .toList(),
                                        presenter: widget.presenter,
                                      ),
                          ),
                          bottomWidget: Selector<TopPresenter, bool>(
                            selector: (_, presenter) =>
                                presenter.isGoogleSearchLoading,
                            builder: (_, ggSearchLoading, __) => ggSearchLoading
                                ? GridView.count(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 60 / 160,
                                    scrollDirection: Axis.horizontal,
                                    children: List.generate(
                                      6,
                                      (_) => const Skeleton(
                                        height: 60,
                                        width: 160,
                                      ),
                                    ),
                                  )
                                : widget.presenter.ggSearchErrorMsg!.isNotEmpty
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Text(
                                              'Education News',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            widget.presenter.ggSearchErrorMsg ??
                                                'Unexpected Error!',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall,
                                          ),
                                        ],
                                      )
                                    : GoogleSearchSection(
                                        googleSearchModels: widget
                                            .presenter.googleSearchResponses,
                                        onSearchKeyTap: pushGoogleSearchWebview,
                                      ),
                          ),

                          // Selector<TopPresenter, bool>(
                          //   selector: (_, notifier) => notifier.isPageLoading,
                          //   builder: (context, isPageLoading, _) =>
                          //       isPageLoading
                          //           ? const HorizontalListCoursesLoading()
                          //           : HorizontalListCourses(
                          //               typeEnum: CoursesType.continueToWatch,
                          //               courses: MockCourses.randomCourses(
                          //                   MockCourses().recommendedLessons, 8)
                          //                 ..shuffle(),
                          //               categoryTitle: 'Continue to Watch',
                          //             ),
                          // ),
                        ),
                        isShowAppBar
                            ? Selector<TopPresenter, double>(
                                selector: (_, presenter) =>
                                    presenter.listGenreHeight,
                                builder: (context, listGenreHeight, _) =>
                                    SizedBox(
                                  height: widget.presenter.listGenreHeight,
                                ),
                              )
                            : ListGenreHorizontal(
                                categories: MockCourses().categories,
                                key: _listGenreKey,
                              ),
                        const SizedBox(height: spacing),
                        Selector<TopPresenter, bool>(
                          selector: (_, notifier) => notifier
                              .isListLoading(CoursesType.recommend.name),
                          builder: (_, isRecommendLoading, __) =>
                              isRecommendLoading
                                  ? const RankingContentLoading()
                                  : Consumer<TopPresenter>(
                                      builder: (__, notifier, _) =>
                                          RankingContent(
                                        courses: widget.presenter
                                            .getListCoursesByType(
                                                CoursesType.recommend.name),
                                        title: 'Recommend Courses',
                                      ),
                                    ),
                        ),
                        Selector<TopPresenter, bool>(
                          selector: (_, notifier) =>
                              notifier.isListLoading(CoursesType.latest.name),
                          builder: (context, isLatestLoading, _) =>
                              isLatestLoading
                                  ? const HorizontalListCoursesLoading()
                                  : HorizontalListCourses(
                                      typeEnum: CoursesType.latest,
                                      courses: widget.presenter
                                          .getListCoursesByType(
                                              CoursesType.latest.name),
                                      categoryTitle: 'Latest Courses',
                                    ),
                        ),
                        const SizedBox(height: spacing),
                        Selector<TopPresenter, bool>(
                          selector: (_, notifier) =>
                              notifier.isListLoading(CoursesType.topRate.name),
                          builder: (context, isTopRateLoading, _) =>
                              isTopRateLoading
                                  ? const HorizontalListCoursesLoading()
                                  : HorizontalListCourses(
                                      typeEnum: CoursesType.topRate,
                                      courses: widget.presenter
                                          .getListCoursesByType(
                                              CoursesType.topRate.name),
                                      categoryTitle: 'Top Rating Courses',
                                    ),
                        ),
                        const SizedBox(height: spacing),
                      ],
                    ),
                  ),

                  /// Pinned app bar
                  Selector<TopPresenter, double>(
                    selector: (_, presenter) => presenter.statusBarHeight,
                    builder: (context, statusBarHeight, _) => isShowAppBar
                        ? Container(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            padding: EdgeInsets.only(
                              top: widget.presenter.statusBarHeight,
                            ),
                            child: ListGenreHorizontal(
                              categories: MockCourses().categories,
                              key: _listGenreKey,
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
              );
            }),
      ),
    );
  }

  @override
  void dispose() {
    widget.presenter.dispose();
    super.dispose();
  }
}
