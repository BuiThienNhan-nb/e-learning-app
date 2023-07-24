import 'package:e_learning_app/features/top/domain/entities/course_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../bases/presentation/atoms/w_image_network.dart';

class RankingItem extends StatelessWidget {
  const RankingItem(
      {Key? key,
      required this.course,
      required this.imageWidth,
      required this.imageHeight})
      : super(key: key);
  final CourseModel course;
  final double imageWidth;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: WImageNetwork(
          imageUrl: course.image ?? '',
          width: imageWidth,
          height: imageHeight,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
