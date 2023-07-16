import 'dart:io';

import 'package:e_learning_app/bases/presentation/atoms/lazy_index_stack.dart';
import 'package:e_learning_app/core/factory/search/search_factory.dart';
import 'package:e_learning_app/core/factory/top/top_factory.dart';
import 'package:e_learning_app/features/enrolled_courses/presentation/pages/enrolled_courses_page.dart';
import 'package:e_learning_app/features/live_stream/presentation/pages/live_stream_page.dart';
import 'package:e_learning_app/features/main/presentation/mobx/main_page_store.dart';
import 'package:e_learning_app/features/search/presentation/search_presenter.dart';
import 'package:e_learning_app/features/search/presentation/search_screen.dart';
import 'package:e_learning_app/features/top/presentation/top_presenter.dart';
import 'package:e_learning_app/features/top/presentation/top_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:provider/provider.dart';

import '../../../../bases/presentation/atoms/bottom_nav_bar/bottom_nav_item.dart';
import '../../../../configs/colors.dart';
import '../../../../generated/translations/locale_keys.g.dart';
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
                create: (_) => makeTopPresenter(),
                child: const TopView(),
              ),
              // const MyTransactionsPage(),
              ChangeNotifierProvider<SearchPresenter>(
                create: (_) => makeSearchPresenter(),
                builder: (_, __) => const SearchView(),
              ),
              const EnrolledCoursesPage(),
              const LiveStreamPage(),
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
          bottomNavigationBar: SizedBox(
            height: Platform.isIOS ? 110 : 90,
            child: Theme(
              data: Theme.of(context).copyWith(
                splashFactory: NoSplash.splashFactory,
              ),
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedFontSize: 0,
                unselectedFontSize: 0,
                currentIndex: store.pageIndex,
                elevation: 0,
                backgroundColor: const Color(0x00ffffff),
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    label: 'Home',
                    icon: BtmNavItem(
                      btnName: 'Home',
                      isActive: false,
                      iconPath: 'assets/icons/ic_home.svg',
                    ),
                    activeIcon: BtmNavItem(
                      btnName: 'Home',
                      isActive: true,
                      iconPath: 'assets/icons/ic_home.svg',
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Search',
                    icon: BtmNavItem(
                      btnName: 'Search',
                      isActive: false,
                      iconPath: 'assets/icons/ic_search.svg',
                    ),
                    activeIcon: BtmNavItem(
                      btnName: 'Search',
                      isActive: true,
                      iconPath: 'assets/icons/ic_search.svg',
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'My List',
                    icon: BtmNavItem(
                      btnName: 'My List',
                      isActive: false,
                      iconPath: 'assets/icons/ic_list.svg',
                    ),
                    activeIcon: BtmNavItem(
                      btnName: 'My List',
                      isActive: true,
                      iconPath: 'assets/icons/ic_list.svg',
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Movie',
                    icon: BtmNavItem(
                      btnName: 'LiveStream',
                      isActive: false,
                      iconPath: 'assets/icons/ic_movie.svg',
                    ),
                    activeIcon: BtmNavItem(
                      btnName: 'LiveStream',
                      isActive: true,
                      iconPath: 'assets/icons/ic_movie.svg',
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Profile',
                    icon: BtmNavItem(
                      btnName: 'Profile',
                      isActive: false,
                      iconPath: 'assets/icons/ic_profile.svg',
                    ),
                    activeIcon: BtmNavItem(
                      btnName: 'Profile',
                      isActive: true,
                      iconPath: 'assets/icons/ic_profile.svg',
                    ),
                  ),
                ],
                onTap: (index) => store.onPageChanged(index),
              ),
            ),
          ),
          // BottomNavigationBar(
          //   type: BottomNavigationBarType.fixed,
          //   items: items,
          //   currentIndex: store.pageIndex,
          //   onTap: (int idx) {
          //     store.onPageChanged(idx);
          //   },
          //   selectedLabelStyle: const TextStyle(
          //     color: AppColors.primaryColor,
          //   ),
          //   showUnselectedLabels: false,
          //   selectedFontSize: 0,
          //   unselectedFontSize: 0,
          // ),
        );
      },
    );
  }
}
