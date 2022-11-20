import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:random_date/random_date.dart';

import '../../features/teacher_detail/domain/entities/teacher_review_model.dart';

@lazySingleton
class MockTeacherReviews {
  final List<String> reviewsContent = [
    "The Mentor is very good! The explanation of him is very clear and easy to understand 😍😍",
    "Extraordinary! I just finished his course and it really helped",
    "Awesome! This is what I looking for. I recommended it to every one ❤️❤️",
    "The quality of the course and the mentor is very good!",
    "good mentor!",
    "Worth for all money that I've paid for him!",
    "Looking forward for your other courses!!!",
  ];

  late final List<TeacherReviewModel> reviews = reviewsContent
      .map(
        (e) => TeacherReviewModel(
          id: "id_teacher_review${Random().nextDouble()}",
          userId: "userId",
          teacherId: "teacherId",
          rate: Random().nextInt(6),
          review: e,
          reviewedAt: RandomDate.withRange(2019, 2022).random(),
        ),
      )
      .toList();
}
