import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../bases/presentation/atoms/text_button.dart';
import '../../../../../bases/presentation/atoms/text_form_field.dart';
import '../../../../../configs/colors.dart';
import '../../../../../configs/dimens.dart';
import '../../../../../configs/styles.dart';
import '../../../../home/domain/entities/lesson_model.dart';
import '../../../../home/domain/entities/section_model.dart';
import '../../states/provider/update_course_provider.dart';

class UpdateSectionsContent extends StatelessWidget {
  const UpdateSectionsContent({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider = context.read<UpdateCourseProvider>();
    // final watch = context.watch<UpdateCourseProvider>();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(AppDimens.largeHeightDimens),
        child: Consumer<UpdateCourseProvider>(
          builder: (context, provider, child) => Column(
            children: [
              ListView.builder(
                itemCount: provider.course.section.length,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: AppDimens.mediumHeightDimens),
                  child: UpdateSectionItem(
                    order: index,
                    onDelete: () => provider.deleteSectionAtIndex(index),
                    section: provider.course.section[index],
                  ),
                ),
              ),
              SizedBox(height: AppDimens.largeHeightDimens),
              DefaultTextButton(
                submit: () => provider.addSection(
                  SectionModel(
                    id: "id_section",
                    title: "",
                    lessons: List<LessonModel>.from([]),
                    order: provider.course.section.length + 1,
                  ),
                ),
                title: "Add Section",
                backgroundColor: AppColors.secondaryColor.withOpacity(0.3),
                titleStyle: AppStyles.headline6TextStyle.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpdateSectionItem extends StatefulWidget {
  UpdateSectionItem({
    super.key,
    required this.order,
    // required this.provider,
    required this.section,
    required this.onDelete,
  });

  int order;
  SectionModel section;
  // final CreateCourseProvider provider;
  final Function()? onDelete;

  @override
  State<UpdateSectionItem> createState() => _UpdateSectionItemState();
}

class _UpdateSectionItemState extends State<UpdateSectionItem> {
  bool isEditing = false;
  final titleController = TextEditingController();
  final TextStyle sectionTitleStyle = AppStyles.subtitle1TextStyle.copyWith(
    fontWeight: FontWeight.w900,
    color: AppColors.neutral.shade700,
  );
  // late SectionModel section;

  void toggle() => setState(() => isEditing = !isEditing);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    print("dispose create section");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // section = widget.sections[widget.order];
    titleController.text = widget.section.title;

    return Container(
      padding: EdgeInsets.all(AppDimens.largeWidthDimens),
      decoration: BoxDecoration(
        border: const Border.fromBorderSide(
          BorderSide(color: AppColors.primaryColor),
        ),
        borderRadius: BorderRadius.circular(AppDimens.itemRadius),
      ),
      child: Row(
        children: [
          Expanded(
            child: isEditing
                ? DefaultTextFormField(
                    labelText: "",
                    hintText: "Section title...",
                    controller: titleController,
                    maxLines: 1,
                  )
                : Text(
                    "Section ${widget.order + 1} - ${titleController.text.trim()}",
                    style: sectionTitleStyle,
                  ),
          ),
          InkWell(
            onTap: () {
              if (isEditing) {
                // section.title = titleController.text.trim();
                context
                    .read<UpdateCourseProvider>()
                    .course
                    .section[widget.order]
                    .title = titleController.text.trim();
              }
              toggle();
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
        ],
      ),
    );
  }
}
