import 'package:e_learning_app/features/create_exam/presentation/pages/create_exam_page.dart';
import 'package:e_learning_app/features/create_exam/presentation/states/create_exam_provider.dart';
import 'package:e_learning_app/features/create_exam/presentation/states/create_exam_store.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../../bases/mobx/base_state.dart';
import '../../../../../../bases/presentation/atoms/default_result_dialog.dart';
import '../../../../../../bases/presentation/atoms/text_button.dart';
import '../../../../../../bases/presentation/atoms/text_form_field.dart';
import '../../../../../../configs/colors.dart';
import '../../../../../../configs/dimens.dart';
import '../../../../../../configs/styles.dart';
import '../../../../../../core/app/loading.dart';
import '../../../../../../generated/translations/locale_keys.g.dart';
import '../../../../../home/domain/entities/lesson_model.dart';
import '../../../../../home/domain/entities/section_model.dart';
import '../../../../../settings/presentation/widgets/setting_app_bar.dart';
import '../../../states/mobx/update_course_store.dart';
import '../../../states/provider/update_course_provider.dart';

class UpdateSectionLessonsPage extends StatelessWidget {
  const UpdateSectionLessonsPage({
    super.key,
    required this.section,
  });

  final SectionModel section;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        TextEditingController(text: section.title);
    final store = context.read<UpdateCourseStore>();
    final int sectionIndex = section.order - 1;

    return Observer(
      builder: (_) {
// Trigger update UI
        if (store.updateSectionState == BaseSate.loading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AppLoading.showLoadingDialog(context);
          });
        }
        if (store.updateSectionState == BaseSate.error ||
            store.errorMessage != null) {
          print(store.errorMessage ?? "Error");
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AppLoading.dismissLoadingDialog(context);
            showDialog(
              context: context,
              builder: (_) => DefaultResultDialog(
                content:
                    store.errorMessage ?? LocaleKeys.serverUnexpectedError.tr(),
                isError: true,
              ),
            );
          });
        } else if (store.updateSectionState == BaseSate.loaded) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              AppLoading.dismissLoadingDialog(context);
              GoRouter.of(context).pop();
            },
          );
        }

        return Scaffold(
          appBar: const SettingAppBar(title: "Update Section"),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              section.title = controller.text.trim();
              // Update
              store.updateSection(
                section,
                context.read<UpdateCourseProvider>().course.id,
              );
            },
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.whiteColor,
            child: const Icon(
              Icons.save_rounded,
              color: AppColors.whiteColor,
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(AppDimens.largeHeightDimens),
              child: Consumer<UpdateCourseProvider>(
                builder: (_, provider, __) => Column(
                  children: [
                    DefaultTextFormField(
                      labelText: "",
                      hintText: "Section title...",
                      controller: controller,
                      maxLines: 1,
                    ),
                    SizedBox(height: AppDimens.largeHeightDimens),
                    ListView.builder(
                      itemCount:
                          provider.course.section[sectionIndex].lessons.length,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, lessonIndex) => Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: AppDimens.mediumHeightDimens),
                        child: UpdateLessonItem(
                          order: provider.countCurrentLessonOrder(
                              sectionIndex, lessonIndex),
                          indexInSection: lessonIndex,
                          sectionOrder: sectionIndex,
                          sections: provider.course.section
                              .map((e) => e.title)
                              .toList(),
                          onDelete: () {
                            provider.deleteLesson(sectionIndex, lessonIndex);
                          },
                          lesson: provider.course.section[sectionIndex]
                              .lessons[lessonIndex],
                          courseId: provider.course.id,
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimens.largeHeightDimens),
                    DefaultTextButton(
                      submit: () {
                        if (provider.course.section.isEmpty) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            showDialog(
                              context: context,
                              builder: (_) => const DefaultResultDialog(
                                content: "You need to add Section first!!",
                                isError: true,
                              ),
                            );
                          });
                        } else {
                          provider.addLesson(sectionIndex);
                        }
                      },
                      title: "Add Lesson",
                      backgroundColor:
                          AppColors.secondaryColor.withOpacity(0.3),
                      titleStyle: AppStyles.headline6TextStyle.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class UpdateLessonItem extends StatefulWidget {
  UpdateLessonItem({
    super.key,
    required this.order,
    required this.indexInSection,
    required this.sectionOrder,
    required this.sections,
    required this.onDelete,
    required this.lesson,
    required this.courseId,
  });

  int order;
  int indexInSection;
  int sectionOrder;
  LessonModel lesson;
  List<String> sections;
  final Function()? onDelete;
  final String courseId;

  @override
  State<UpdateLessonItem> createState() => _UpdateLessonItemState();
}

class _UpdateLessonItemState extends State<UpdateLessonItem> {
  bool isEditing = false;
  final titleController = TextEditingController();
  final sourceController = TextEditingController();
  late String selectedSection;
  final TextStyle sectionTitleStyle = AppStyles.headline6TextStyle.copyWith(
    fontWeight: FontWeight.w900,
    color: AppColors.neutral.shade700,
  );

  void toggle() => setState(() => isEditing = !isEditing);

  bool checkListDropdownValidate(List<String> items) {
    if (items.any((e) => e.isEmpty) || items.length > items.toSet().length) {
      return false;
    }
    return true;
  }

  String? checkCanUpdateSection(int index, UpdateCourseProvider provider) {
    if (index == widget.sectionOrder) {
      return null;
    }
    // Is the first lesson of the section -> just allow to update to previous section
    if (widget.indexInSection == 0 && index != widget.sectionOrder - 1) {
      return "You just can update this first lesson of the section to the previous section!";
    }
    if (widget.indexInSection == 0 && index == widget.sectionOrder - 1) {
      updateToPreviousSection(provider);
      return null;
    }
    // Is the last lesson of the section -> just allow to update to later section
    if (widget.indexInSection ==
            provider.course.section[widget.sectionOrder].lessons.length - 1 &&
        index != widget.sectionOrder + 1) {
      return "You just can update this last lesson of the section to later section!";
    }
    if (widget.indexInSection ==
            provider.course.section[widget.sectionOrder].lessons.length - 1 &&
        index == widget.sectionOrder + 1) {
      updateToLaterSection(provider);
      return null;
    }

    return "You can just update lesson which is at the boundaries of the section, and update sequentially!";
  }

  updateToPreviousSection(UpdateCourseProvider provider) {
    provider.addLessonInSection(
      widget.sectionOrder - 1,
      LessonModel(
        id: "id_lesson_${widget.order}",
        order: widget.order,
        title: titleController.text.trim(),
        videoUrl: sourceController.text.trim(),
        length: 0,
      ),
    );
    provider.removeLessonAt(widget.sectionOrder, 0);
  }

  updateToLaterSection(UpdateCourseProvider provider) {
    provider.insertLessonAt(
      widget.sectionOrder + 1,
      0,
      LessonModel(
        id: "id_lesson_${widget.order}",
        order: widget.order,
        title: titleController.text.trim(),
        videoUrl: sourceController.text.trim(),
        length: 0,
      ),
    );
    provider.removeLessonAt(widget.sectionOrder, widget.indexInSection);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<UpdateCourseProvider>();
    titleController.text = provider.course.section[widget.sectionOrder]
        .lessons[widget.indexInSection].title;
    sourceController.text = provider.course.section[widget.sectionOrder]
            .lessons[widget.indexInSection].videoUrl ??
        "N/A";
    selectedSection = widget.sections[widget.sectionOrder];

    return Container(
      padding: EdgeInsets.all(AppDimens.largeWidthDimens),
      decoration: BoxDecoration(
        border: const Border.fromBorderSide(
          BorderSide(color: AppColors.primaryColor),
        ),
        borderRadius: BorderRadius.circular(AppDimens.itemRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: isEditing
                    ? DefaultTextFormField(
                        labelText: "",
                        hintText: "Lesson title...",
                        controller: titleController,
                        maxLines: 1,
                      )
                    : Text(
                        "${widget.order}. ${titleController.text.trim()}",
                        style: sectionTitleStyle,
                      ),
              ),
              InkWell(
                onTap: () {
                  if (!checkListDropdownValidate(widget.sections)) {
                    return WidgetsBinding.instance.addPostFrameCallback((_) {
                      showDialog(
                        context: context,
                        builder: (_) => const DefaultResultDialog(
                          content:
                              "Section Title must be UNIQUE or not be NULL",
                          isError: true,
                        ),
                      );
                    });
                  }
                  if (isEditing) {
                    for (var section in provider.course.section) {
                      for (var lesson in section.lessons) {
                        if (lesson.order == widget.order) {
                          print("detect lesson");
                          lesson.title = titleController.text.trim();
                          lesson.videoUrl = sourceController.text.trim();
                          return toggle();
                        }
                      }
                    }
                  }
                  print("cannot detect lesson");
                  return toggle();
                },
                child: SizedBox(
                  height: AppDimens.extraLargeHeightDimens * 1.2,
                  width: AppDimens.extraLargeWidthDimens * 1.2,
                  child: isEditing
                      ? const Icon(
                          Icons.done,
                          color: AppColors.primaryColor,
                        )
                      : const Icon(
                          Icons.edit,
                          color: AppColors.primaryColor,
                        ),
                ),
              ),
              InkWell(
                onTap: widget.onDelete,
                child: SizedBox(
                  height: AppDimens.extraLargeHeightDimens * 1.2,
                  width: AppDimens.extraLargeWidthDimens * 1.2,
                  child: const Icon(
                    Icons.close,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              if (!widget.lesson.id.contains('id_'))
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => MultiProvider(
                          providers: [
                            ChangeNotifierProvider<CreateExamProvider>(
                              create: (_) => GetIt.I(),
                              lazy: true,
                            ),
                            Provider<CreateExamStore>(
                              create: (_) => GetIt.I(),
                              lazy: true,
                            ),
                          ],
                          child: CreateExamPage(
                            lessonId: widget.lesson.id,
                            lessonTitle: titleController.text.trim(),
                          ),
                        ),
                      ),
                    );
                    // GoRouter.of(context).pushNamed(
                    //   "create_exam",
                    //   params: {
                    //     "courseId": widget.courseId,
                    //     "lessonId": "${widget.courseId}${widget.order}",
                    //     "lessonTitle": titleController.text.trim(),
                    //   },
                    // );
                  },
                  child: SizedBox(
                    height: AppDimens.extraLargeHeightDimens * 1.2,
                    width: AppDimens.extraLargeWidthDimens * 1.2,
                    child: const Icon(
                      Icons.document_scanner,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Text(
              "Video source: ${sourceController.text.trim()}",
              style: sectionTitleStyle,
            ),
          ),
          Text(
            "Section: $selectedSection",
            style: sectionTitleStyle,
          ),
        ],
      ),
    );
  }
}
