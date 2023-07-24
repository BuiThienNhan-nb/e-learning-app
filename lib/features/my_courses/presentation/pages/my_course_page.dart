import 'package:e_learning_app/features/my_courses/presentation/states/mobx/create_course_store.dart';
import 'package:e_learning_app/features/my_courses/presentation/states/mobx/update_course_store.dart';
import 'package:e_learning_app/features/my_courses/presentation/states/provider/create_course_provider.dart';
import 'package:e_learning_app/features/my_courses/presentation/states/provider/update_course_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../bases/presentation/atoms/loading_dialog.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/styles.dart';
import '../../../settings/presentation/widgets/setting_app_bar.dart';
import '../states/mobx/my_course_store.dart';
import '../widgets/my_course_card.dart';
import 'add_course/create_course_page.dart';
import 'update_course/update_course_page.dart';

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
              ? RefreshIndicator(
                  onRefresh: () => store.getMyCourses(),
                  child: ListView.builder(
                    itemCount: store.courses!.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => MultiProvider(
                          providers: [
                            Provider<UpdateCourseStore>(
                              create: (_) => GetIt.I<UpdateCourseStore>(),
                              lazy: true,
                            ),
                            ChangeNotifierProvider<UpdateCourseProvider>(
                              create: (_) => GetIt.I<UpdateCourseProvider>(),
                              lazy: true,
                            ),
                          ],
                          child: UpdateCoursePage(
                            courseId: store.courses![index].id,
                          ),
                        ),
                      )),
                      //  GoRouter.of(context).pushNamed(
                      //   "update_course",
                      //   params: {
                      //     'courseId': store.courses![index].id,
                      //   },
                      //   // extra: [
                      //   //   context.read<UpdateCourseStore>(),
                      //   //   context.read<UpdateCourseProvider>(),
                      //   // ],
                      // ),
                      child: MyCourseCard(course: store.courses![index]),
                    ),
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
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => MultiProvider(
                providers: [
                  Provider<CreateCourseStore>(
                    create: (_) => GetIt.I(),
                    lazy: true,
                  ),
                  Provider<CreateCourseProvider>(
                    create: (_) => GetIt.I(),
                    lazy: true,
                  ),
                ],
                child: const CreateCoursePage(),
              ),
            )),
          ),
        );
      },
    );
  }
}
