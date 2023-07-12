import 'dart:math';
import 'dart:developer' as logger;

import 'package:e_learning_app/bases/presentation/atoms/dropdown_button.dart';
import 'package:e_learning_app/features/home/domain/entities/lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../bases/presentation/atoms/default_result_dialog.dart';
import '../../../../../bases/presentation/atoms/text_button.dart';
import '../../../../../bases/presentation/atoms/text_form_field.dart';
import '../../../../../configs/colors.dart';
import '../../../../../configs/dimens.dart';
import '../../../../../configs/styles.dart';
import '../../states/provider/create_course_provider.dart';

class AddLessonContent extends StatefulWidget {
  const AddLessonContent({
    super.key,
    required this.provider,
  });

  final CreateCourseProvider provider;

  @override
  State<AddLessonContent> createState() => _AddLessonContentState();
}

class _AddLessonContentState extends State<AddLessonContent> {
  int getSectionIndex(LessonModel lesson) {
    int sectionOrder = 0;
    for (var s in widget.provider.sections) {
      for (var l in s.lessons) {
        if (l.order == lesson.order) {
          return sectionOrder;
        }
      }
      sectionOrder++;
    }
    return sectionOrder;
  }

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(AppDimens.largeHeightDimens),
        child: Column(
          children: [
            ListView.builder(
              // itemCount: widget.provider.lessonOrder - 1,
              itemCount: widget.provider.sections.length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, sectionIdex) => ListView.builder(
                itemCount: widget.provider.sections[sectionIdex].lessons.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, lessonIndex) => Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: AppDimens.mediumHeightDimens),
                  child: AddLessonItem(
                    order: widget.provider
                        .countLessonOrder(sectionIdex, lessonIndex),
                    indexInSection: lessonIndex,
                    provider: widget.provider,
                    sections:
                        widget.provider.sections.map((e) => e.title).toList(),
                    onDelete: (p0) {},
                    sectionOrder: sectionIdex,
                    trigger: () {
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: AppDimens.largeHeightDimens),
            DefaultTextButton(
              submit: () {
                if (widget.provider.sections.isEmpty) {
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
                  setState(
                    () => widget.provider
                        .sections[widget.provider.countCurrentSection()].lessons
                        .add(
                      LessonModel(
                        id: "id_${Random().nextBool()}_${Random().nextBool()}",
                        order: widget.provider.getLessonOrder(
                            widget.provider.sections.last.lessons.length),
                        title: "",
                        videoUrl: "",
                        length: 0,
                      ),
                    ),
                  );
                }
              },
              title: "Add Lesson",
              backgroundColor: AppColors.secondaryColor.withOpacity(0.3),
              titleStyle: AppStyles.headline6TextStyle.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddLessonItem extends StatefulWidget {
  AddLessonItem({
    super.key,
    required this.order,
    required this.provider,
    required this.indexInSection,
    required this.sections,
    required this.onDelete,
    required this.sectionOrder,
    required this.trigger,
  });

  int order;
  int indexInSection;
  int sectionOrder;
  List<String> sections;
  final CreateCourseProvider provider;
  final Function(int)? onDelete;
  final Function() trigger;

  @override
  State<AddLessonItem> createState() => _AddLessonItemState();
}

class _AddLessonItemState extends State<AddLessonItem> {
  bool isEditing = false;
  final titleController = TextEditingController();
  final sourceController = TextEditingController(text: "N/A");
  late String selectedSection;

  final TextStyle sectionTitleStyle = AppStyles.headline6TextStyle.copyWith(
    fontWeight: FontWeight.w900,
    color: AppColors.neutral.shade700,
  );
  // late LessonModel lesson;

  void toggle() => setState(() => isEditing = !isEditing);

  bool checkListDropdownValidate(List<String> items) {
    if (items.any((e) => e.isEmpty) || items.length > items.toSet().length) {
      return false;
    }
    return true;
  }

  String? checkCanUpdateSection(int index) {
    if (index == widget.sectionOrder) {
      return null;
    }
    // Is the first lesson of the section -> just allow to update to previous section
    if (widget.indexInSection == 0 && index != widget.sectionOrder - 1) {
      return "You just can update this first lesson of the section to the previous section!";
    }
    if (widget.indexInSection == 0 && index == widget.sectionOrder - 1) {
      updateToPreviousSection();
      return null;
    }
    // Is the last lesson of the section -> just allow to update to later section
    if (widget.indexInSection ==
            widget.provider.sections[widget.sectionOrder].lessons.length - 1 &&
        index != widget.sectionOrder + 1) {
      return "You just can update this last lesson of the section to later section!";
    }
    if (widget.indexInSection ==
            widget.provider.sections[widget.sectionOrder].lessons.length - 1 &&
        index == widget.sectionOrder + 1) {
      updateToLaterSection();
      return null;
    }

    return "You can just update lesson which is at the boundaries of the section, and update sequentially!";
  }

  updateToPreviousSection() {
    widget.provider.sections[widget.sectionOrder - 1].lessons.add(
      LessonModel(
        id: "id_lesson_${widget.order}",
        order: widget.order,
        title: titleController.text.trim(),
        videoUrl: sourceController.text.trim(),
        length: 0,
      ),
    );
    widget.provider.sections[widget.sectionOrder].lessons.removeAt(0);
    widget.trigger();
  }

  updateToLaterSection() {
    widget.provider.sections[widget.sectionOrder + 1].lessons.insert(
      0,
      LessonModel(
        id: "id_lesson_${widget.order}",
        order: widget.order,
        title: titleController.text.trim(),
        videoUrl: sourceController.text.trim(),
        length: 0,
      ),
    );
    widget.provider.sections[widget.sectionOrder].lessons
        .removeAt(widget.indexInSection);
    widget.trigger();
  }

  Future<String> _pickVideo() async {
    XFile? xFile = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (xFile == null) return "";
    sourceController.text = xFile.path;
    for (var section in widget.provider.sections) {
      for (var lesson in section.lessons) {
        if (lesson.order == widget.order) {
          print("detect lesson");
          lesson.videoUrl = sourceController.text.trim();
          continue;
        }
      }
    }
    setState(() {});
    return xFile.path;
  }

  @override
  Widget build(BuildContext context) {
    titleController.text = widget.provider.sections[widget.sectionOrder]
        .lessons[widget.indexInSection].title;
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
                    for (var section in widget.provider.sections) {
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
                onTap: widget.onDelete!(1),
                child: SizedBox(
                  height: AppDimens.extraLargeHeightDimens * 1.2,
                  width: AppDimens.extraLargeWidthDimens * 1.2,
                  child: const Icon(
                    Icons.close,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              _pickVideo();
            },
            child: Text(
              "Video source: ${sourceController.text.trim()}",
              style: sectionTitleStyle,
            ),
          ),
          isEditing
              ? DefaultDropdownButton(
                  labelText: "",
                  prefixIcon: null,
                  selectedIndex: widget.sectionOrder,
                  items: widget.sections,
                  onChanged: (value) {
                    String? error = checkCanUpdateSection(value);

                    if (error != null) {
                      return WidgetsBinding.instance.addPostFrameCallback((_) {
                        showDialog(
                          context: context,
                          builder: (_) => DefaultResultDialog(
                            content: error,
                            isError: true,
                          ),
                        );
                      });
                    }
                    return setState(() => widget.sectionOrder = value);
                  },
                )
              : Text(
                  "Section: $selectedSection",
                  style: sectionTitleStyle,
                ),
        ],
      ),
    );
  }
}
