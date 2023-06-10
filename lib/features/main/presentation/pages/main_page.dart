/*
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../configs/colors.dart';
import '../../../../utils/nav_bar/nav_bar_item.dart';
import '../../../../utils/nav_bar/nav_bar_tab.dart';
import '../mobx/main_page_store.dart';

/// Builds the "shell" for the app by building a Scaffold with a
/// BottomNavigationBar, where [child] is placed in the body of the Scaffold.
class ScaffoldWithNavBar extends StatefulWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.currentNavigator,
    required this.currentRouterState,
    required this.tabs,
    required this.routes,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigator for the currently active tab
  final Navigator currentNavigator;

  /// The pages for the current route
  List<Page<dynamic>> get pagesForCurrentRoute => currentNavigator.pages;

  /// The current router state
  final GoRouterState currentRouterState;

  /// The tabs
  final List<ScaffoldWithNavBarTabItem> tabs;

  // The routes
  final List<RouteBase> routes;

  @override
  State<StatefulWidget> createState() => ScaffoldWithNavBarState();
}

/// State for ScaffoldWithNavBar
class ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  late final List<NavBarTabNavigator> _tabs;

  //
  int _locationToTabIndex(String location) {
    final int index = _tabs.indexWhere(
      (NavBarTabNavigator t) => location.startsWith(t.rootRoutePath),
    );
    return index < 0 ? 0 : index;
  }

  MainPageStore? store;

  @override
  void initState() {
    super.initState();
    _tabs = widget.tabs
        .map((ScaffoldWithNavBarTabItem e) => NavBarTabNavigator(e))
        .toList();
  }

  @override
  void didUpdateWidget(covariant ScaffoldWithNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateForCurrentTab();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store ??= GetIt.I<MainPageStore>();
    _updateForCurrentTab();
  }

  void _updateForCurrentTab() {
    final location = GoRouter.of(context).location;
    store!.pageIndex = _locationToTabIndex(location);

    final NavBarTabNavigator tabNav = _tabs[store!.pageIndex];
    tabNav.pages = widget.pagesForCurrentRoute;
    tabNav.lastLocation = location;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: store!.pageIndex == 0 ? MainAppBar() : null,
      body: _buildBody(context),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:
            _tabs.map((NavBarTabNavigator e) => e.bottomNavigationTab).toList(),
        currentIndex: store!.pageIndex,
        onTap: (int idx) =>
            store!.onPageChanged(idx, context, _tabs[idx].currentLocation),
        selectedLabelStyle: const TextStyle(
          color: AppColors.primaryColor,
        ),
        showUnselectedLabels: false,
        selectedFontSize: 0,
        unselectedFontSize: 0,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: IndexedStack(
        index: store!.pageIndex,
        children: _tabs
            .map((NavBarTabNavigator tab) => tab.buildNavigator(context))
            .toList(),
      ),
    );
  }

  // void _onItemTapped(int index, BuildContext context) {
  //   GoRouter.of(context).go(_tabs[index].currentLocation);
  // }
}
*/

import 'package:e_learning_app/bases/presentation/atoms/lazy_index_stack.dart';
import 'package:e_learning_app/features/enrolled_courses/presentation/pages/enrolled_courses_page.dart';
import 'package:e_learning_app/features/live_stream/presentation/pages/live_stream_page.dart';
import 'package:e_learning_app/features/main/presentation/mobx/main_page_store.dart';
import 'package:e_learning_app/features/presenters/top/provider_top_presenter.dart';
import 'package:e_learning_app/features/presenters/top/top_state.dart';
import 'package:e_learning_app/features/top/presentation/top_presenter.dart';
import 'package:e_learning_app/features/top/presentation/top_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:provider/provider.dart';

import '../../../../configs/colors.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../../my_transactions/presentations/pages/my_transactions_page.dart';
import '../../../settings/presentation/pages/settings_page.dart';
import '../../../settings/presentation/states/mobx/update_avatar_store.dart';
import '../../../settings/presentation/states/provider/settings_page_provider.dart';

class MainPage extends StatefulWidget with GetItStatefulWidgetMixin {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin, GetItStateMixin {
  late final MainPageStore store;
  // Tabs
  late final TabController tabController = TabController(
    length: 5,
    vsync: this,
    initialIndex: store.pageIndex,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = GetIt.I<MainPageStore>();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  // Build bottom nav bar items
  final List<String> iconDataSource = [
    "assets/icons/home_inactive_icon.png",
    "assets/icons/home_active_icon.png",
    "assets/icons/screen_inactive_icon.png",
    "assets/icons/screen_active_icon.png",
    "assets/icons/my_course_inactive_icon.png",
    "assets/icons/my_course_active_icon.png",
    "assets/icons/shopping_cart_inactive_icon.png",
    "assets/icons/shopping_cart_active_icon.png",
    "assets/icons/user_icon.png",
    "assets/icons/user_fill_icon.png",
  ];
  int iconDataSourceIndex = 0;
  late final List<BottomNavigationBarItem> items = List.from([1, 2, 3, 4, 5])
      .map(
        (rootPath) => BottomNavigationBarItem(
          icon: Image.asset(
            iconDataSource[iconDataSourceIndex++],
            color: AppColors.neutral.shade700,
          ),
          label: LocaleKeys.home.tr(),
          backgroundColor: AppColors.whiteColor,
          activeIcon: Image.asset(
            iconDataSource[iconDataSourceIndex++],
            color: AppColors.primaryColor,
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        tabController.index = store.pageIndex;

        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: LazyIndexedStack(
            index: tabController.index,
            children: [
              // const HomePage(),
              ChangeNotifierProvider<TopPresenter>(
                create: (_) => ProviderTopPresenter(TopState.initial()),
                child: const TopView(),
              ),
              const LiveStreamPage(),
              const EnrolledCoursesPage(),
              const MyTransactionsPage(),
              MultiProvider(
                providers: [
                  ChangeNotifierProvider<SettingsPageProvider>(
                    create: (BuildContext context) => GetIt.I(),
                    lazy: true,
                  ),
                  Provider<UpdateAvatarStore>(
                    create: (_) => GetIt.I(),
                    lazy: true,
                  ),
                ],
                child: const SettingsPage(),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: items,
            currentIndex: store.pageIndex,
            onTap: (int idx) {
              // tabController.animateTo(
              //   idx,
              //   duration: const Duration(milliseconds: 500),
              //   curve: Curves.easeInOut,
              // );
              store.onPageChanged(idx);
            },
            selectedLabelStyle: const TextStyle(
              color: AppColors.primaryColor,
            ),
            showUnselectedLabels: false,
            selectedFontSize: 0,
            unselectedFontSize: 0,
          ),
        );
      },
    );
  }
}
