import 'dart:developer';

import 'package:e_learning_app/configs/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../bases/presentation/atoms/round_teacher_item.dart';
import '../states/teacher/get_top_teachers_store.dart';

class TeacherListView extends StatelessWidget {
  const TeacherListView({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I<GetTopTeachersStore>();
    return SizedBox(
      height: height,
      child: Observer(
        builder: (context) {
          if (store.state == BaseSate.init) {
            store.getTopTeachers();
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

          return ListView.builder(
            itemCount: store.topTeachers!.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) => TeacherListItem(
              store: store,
              index: index,
            ),
          );
        },
      ),
    );
  }
}

class TeacherListItem extends StatelessWidget {
  const TeacherListItem({
    Key? key,
    required this.store,
    required this.index,
  }) : super(key: key);

  final GetTopTeachersStore store;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).pushNamed(
        "teacher_detail",
        params: {
          'teacherId': store.topTeachers![index].id,
        },
        extra: store.topTeachers![index],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: index == 0
              ? AppDimens.mediumWidthDimens
              : AppDimens.mediumWidthDimens,
        ),
        child: RoundTeacherItem(
          teacher: store.topTeachers![index],
        ),
      ),
    );
  }
}
