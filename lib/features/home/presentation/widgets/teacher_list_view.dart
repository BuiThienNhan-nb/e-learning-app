import 'package:e_learning_app/configs/dimens.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../bases/presentation/atoms/round_teacher_item.dart';
import '../../../../utils/mock/mock_teachers.dart';

class TeacherListView extends StatelessWidget {
  const TeacherListView({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    final teachers = GetIt.I<MockTeachers>().topTeachers;
    return SizedBox(
      height: height,
      child: ListView.builder(
        itemCount: teachers.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
            left: index == 0
                ? AppDimens.mediumWidthDimens
                : AppDimens.mediumWidthDimens,
          ),
          child: RoundTeacherItem(
            teacher: teachers[index],
          ),
        ),
      ),
    );
  }
}
