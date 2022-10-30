import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_learning_app/bases/presentation/atoms/recommendation_lesson_card.dart';
import 'package:e_learning_app/configs/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../bases/mobx/base_state.dart';
import '../states/lesson/get_rcm_lessons_store.dart';

class RecommendationLessonPageView extends StatelessWidget {
  const RecommendationLessonPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I<GetRecommendedLessonsStore>();
    // final height = AppDimens.extraLargeHeightDimens * 9;
    return SizedBox(
      height: AppDimens.extraLargeHeightDimens * 9,
      child: Observer(
        builder: (context) {
          if (store.state == BaseSate.init) {
            store.getRecommendedLessons();
          }
          if (store.state == BaseSate.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (store.state == BaseSate.error || store.errorMessage != null) {
            log(store.errorMessage ?? "Error");
            return Center(
              child: Text(store.errorMessage ?? "Error!"),
            );
          }

          return CarouselSlider.builder(
            itemCount: store.recommendedLessons!.length,
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              viewportFraction: 1,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              clipBehavior: Clip.none,
              enableInfiniteScroll: true,
              // height: height,
            ),
            itemBuilder: (context, index, realIndex) {
              return RecommendationLessonCard(
                  lesson: store.recommendedLessons![index]);
            },
          );
        },
      ),
    );
  }
}
