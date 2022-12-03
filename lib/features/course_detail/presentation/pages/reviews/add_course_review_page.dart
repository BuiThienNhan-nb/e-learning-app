import 'package:e_learning_app/features/home/domain/entities/course_model.dart';
import 'package:flutter/material.dart';

import '../../../../../bases/presentation/atoms/default_app_bar.dart';

class AddCourseReviewPage extends StatelessWidget {
  const AddCourseReviewPage({
    super.key,
    required this.course,
  });

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(title: "Rate this course"),
    );
  }
}
