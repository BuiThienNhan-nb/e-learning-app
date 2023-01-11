import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../bases/presentation/atoms/loading_dialog.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/styles.dart';
import '../../../settings/presentation/widgets/setting_app_bar.dart';
import '../states/mobx/my_course_store.dart';
import '../widgets/my_course_card.dart';

class MyCoursePage extends StatelessWidget {
  const MyCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final courses = GetIt.I<MockCourses>().recommendedLessons;
    final store = context.read<MyCourseStore>();

    return Observer(
      builder: (_) {
        if (store.state == BaseSate.init) {
          store.getMyCourses();
        }

        return Scaffold(
          appBar: const SettingAppBar(title: "My Courses"),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: store.state == BaseSate.loaded
              ? ListView.builder(
                  itemCount: store.courses!.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => GoRouter.of(context).pushNamed(
                      "update_course",
                      params: {
                        'courseId': store.courses![index].id,
                      },
                      // extra: [
                      //   context.read<UpdateCourseStore>(),
                      //   context.read<UpdateCourseProvider>(),
                      // ],
                    ),
                    child: MyCourseCard(course: store.courses![index]),
                  ),
                )
              : Center(
                  child: store.state == BaseSate.loading
                      ? const LoadingWidget()
                      : Text(
                          store.errorMessage ?? "Unexpected error!",
                          style: AppStyles.subtitle1TextStyle,
                        ),
                ),
          floatingActionButton: FloatingActionButton(
            tooltip: "Create new course",
            foregroundColor: AppColors.whiteColor,
            backgroundColor: AppColors.primaryColor,
            child: const Icon(Icons.add),
            onPressed: () => GoRouter.of(context).pushNamed("create_course"),
          ),
        );
      },
    );
  }
}
