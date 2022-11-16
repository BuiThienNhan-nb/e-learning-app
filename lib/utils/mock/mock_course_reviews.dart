import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:random_date/random_date.dart';

import '../../features/course_detail/domain/entities/course_review_model.dart';

@lazySingleton
class MockCourseReviews {
  final List<String> reviewsContent = [
    "The course is very good! The explanation of the mentor is very clear and easy to understand 😍😍",
    "Extraordinary! I just finished it and it really helped",
    "Awesome! This is what I looking for. I recommended it to every one ❤️❤️",
    "The quality of the course and the mentor is very good!",
    "good course!",
    "Worth for all money that I've paid for it!",
    "Looking forward for your other courses",
  ];

  late final List<CourseReviewModel> reviews = reviewsContent
      .map(
        (e) => CourseReviewModel(
          id: "id_${Random().nextDouble()}",
          userId: "userId",
          courseId: "courseId",
          rate: Random().nextInt(6),
          review: e,
          reviewedAt: RandomDate.withRange(2019, 2022).random(),
        ),
      )
      .toList();
}
