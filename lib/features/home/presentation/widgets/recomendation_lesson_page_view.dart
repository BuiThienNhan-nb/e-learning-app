import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_learning_app/bases/presentation/atoms/recommendation_lesson_card.dart';
import 'package:e_learning_app/configs/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../utils/mock/mock_lessons.dart';

class RecommendationLessonPageView extends StatelessWidget {
  const RecommendationLessonPageView({
    super.key,
    // required this.pages,
  });

  // final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    final lessons = GetIt.I<MockLessons>().recommendedLessons;
    return SizedBox(
      child: CarouselSlider.builder(
        itemCount: lessons.length,
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          viewportFraction: 1,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          clipBehavior: Clip.none,
          enableInfiniteScroll: true,
          height: AppDimens.extraLargeHeightDimens * 9,
        ),
        itemBuilder: (context, index, realIndex) {
          return RecommendationLessonCard(lesson: lessons[index]);
        },
      ),
    );
  }
}
