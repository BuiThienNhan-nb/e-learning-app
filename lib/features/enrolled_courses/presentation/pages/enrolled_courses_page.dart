import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../bases/presentation/atoms/default_app_bar.dart';
import '../../../../bases/presentation/atoms/default_sliver_appbar.dart';
import '../../../../bases/presentation/atoms/loading_dialog.dart';
import '../../../../configs/styles.dart';
import '../../../../core/app/provider.dart';
import '../../states/mobx/enrolled_course_store.dart';
import '../widgets/enrolled_course_card.dart';

class EnrolledCoursesPage extends StatelessWidget {
  const EnrolledCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<CourseModel> courses = GetIt.I<MockCourses>().recommendedLessons;
    final store = GetIt.I<EnrolledCourseStore>();

    return RefreshIndicator(
      onRefresh: () async =>
          store.getCourseByListId(GetIt.I<AppProvider>().user.courseJoined),
      child: Observer(
        builder: (_) {
          if (store.state == BaseSate.init) {
            store.getCourseByListId(GetIt.I<AppProvider>().user.courseJoined);
          }

          return store.state == BaseSate.loaded
              ? SafeArea(
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      const DefaultSliverAppBar(title: "Enrolled Courses"),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            ListView.builder(
                              itemCount: store.courses!.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () => GoRouter.of(context).pushNamed(
                                  "course_detail",
                                  params: {
                                    'courseId': store.courses![index].id,
                                  },
                                ),
                                child: EnrolledCourseCard(
                                  course: store.courses![index],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : SafeArea(
                  child: Scaffold(
                    appBar: const DefaultAppBar(title: "Enrolled Courses"),
                    body: Center(
                      child: store.state == BaseSate.loading
                          ? const LoadingWidget()
                          : Text(
                              store.errorMessage ?? "Unexpected error!",
                              style: AppStyles.subtitle1TextStyle,
                            ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
