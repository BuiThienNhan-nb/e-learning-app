import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../bases/presentation/atoms/loading_dialog.dart';
import '../../../../bases/presentation/atoms/recommendation_course_card.dart';
import '../../../settings/presentation/widgets/setting_app_bar.dart';
import '../state/get_all_courses_store.dart';

class GetAllCoursesPage extends StatelessWidget {
  const GetAllCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<GetAllCoursesStore>();

    return Observer(
      builder: (_) {
        if (store.state == BaseSate.init) {
          store.getAllCourses();
        }

        return Scaffold(
          appBar: const SettingAppBar(title: "All Courses"),
          body: store.state == BaseSate.loaded
              ? ListView.builder(
                  itemCount: store.courses!.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => GoRouter.of(context).pushNamed(
                      "course_detail",
                      params: {
                        'courseId': store.courses![index].id,
                      },
                    ),
                    child: RecommendationCourseCard(
                      course: store.courses![index],
                    ),
                  ),
                )
              : Center(
                  child: store.state == BaseSate.loading
                      ? const LoadingWidget()
                      : Text(store.errorMessage ?? "Unexpected Error!!"),
                ),
        );
      },
    );
  }
}
