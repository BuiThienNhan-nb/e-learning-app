import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/core/factory/list/list_factory.dart';
import 'package:e_learning_app/features/list/presentation/list_screen_presenter.dart';
import 'package:e_learning_app/features/presenters/top/top_state.dart';
import 'package:e_learning_app/features/top/domain/entities/course_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../bases/presentation/animations/text_slide_animation.dart';
import '../../../../../bases/presentation/atoms/skeleton.dart';
import '../../top_presenter.dart';
import 'carousel_ranking_list.dart';
import 'ranking_item.dart';
import 'ranking_title.dart';

class RankingContentLoading extends StatelessWidget {
  const RankingContentLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 20, top: 20),
        height: 300,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton(
                width: MediaQuery.of(context).size.width - 40,
                height: 140,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Skeleton(
            width: MediaQuery.of(context).size.width - 105,
            height: 15,
          ),
          const SizedBox(
            height: 10,
          ),
          Skeleton(
            width: (MediaQuery.of(context).size.width - 50) * 0.5,
            height: 15,
          ),
        ]));
  }
}

class RankingContent extends StatelessWidget {
  const RankingContent({
    Key? key,
    required this.courses,
    required this.title,
  }) : super(key: key);
  final List<CourseModel> courses;
  final String title;
  final rankingListHeight = 180.0;
  final _rankingTitleHeight = 50.0;
  final imageHeight = 180.0;
  final itemHeight = 220.0;

  @override
  Widget build(BuildContext context) {
    final itemWidth = MediaQuery.of(context).size.width - 30;
    final imageWidth = MediaQuery.of(context).size.width - 68;

    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Positioned(
            // left: 20,
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ChangeNotifierProvider<ListScreenPresenter>(
                    create: (_) => makeListScreenPresenter(),
                    lazy: true,
                    child: makeListScreenView(CoursesType.recommend),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 20),
                  Text(
                    'Recommended Courses',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    CupertinoIcons.forward,
                    color: AppColors.iconActive,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: CarouselRankingList(
              itemWidth: itemWidth,
              itemHeight: itemHeight,
              itemBuilder: (BuildContext context, int index) {
                return RankingItem(
                  course: courses[index],
                  imageWidth: imageWidth,
                  imageHeight: imageHeight,
                );
              },
              itemCount: courses.length,
              onItemChanged: (int currentIndex) {
                context.read<TopPresenter>().updateRankingIndex(currentIndex);
              },
              onItemClicked: (int index) {},
            ),
          ),
          Consumer<TopPresenter>(
            builder: (context, notifier, child) => Positioned(
              bottom: 26,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SizedBox(
                  height: _rankingTitleHeight,
                  child: TextSlideAnimation(
                    height: _rankingTitleHeight,
                    animationDuration: const Duration(milliseconds: 750),
                    itemBuilder: (int index) {
                      return RankingTitle(
                          rankingTitle: courses[index].title,
                          rankingIndex: index + 1);
                    },
                    itemCount: courses.length,
                    currentIndex: notifier.rankingIndex,
                    beforeRankingIndex: notifier.beforeRankingIndex,
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
