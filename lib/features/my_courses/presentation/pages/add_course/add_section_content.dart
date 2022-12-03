import 'dart:developer';

import 'package:e_learning_app/features/home/domain/entities/lesson_model.dart';
import 'package:e_learning_app/features/home/domain/entities/section_model.dart';
import 'package:flutter/material.dart';

import '../../../../../bases/presentation/atoms/text_button.dart';
import '../../../../../bases/presentation/atoms/text_form_field.dart';
import '../../../../../configs/colors.dart';
import '../../../../../configs/dimens.dart';
import '../../../../../configs/styles.dart';
import '../../states/provider/create_course_provider.dart';

class AddSectionContent extends StatefulWidget {
  const AddSectionContent({
    super.key,
    required this.provider,
  });

  final CreateCourseProvider provider;

  @override
  State<AddSectionContent> createState() => _AddSectionContentState();
}

class _AddSectionContentState extends State<AddSectionContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(AppDimens.largeHeightDimens),
        child: Column(
          children: [
            ListView.builder(
              itemCount: widget.provider.sections.length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppDimens.mediumHeightDimens),
                child: AddSectionItem(
                  order: index,
                  provider: widget.provider,
                  onDelete: () {
                    setState(
                      () => widget.provider.sections.removeAt(index),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: AppDimens.largeHeightDimens),
            DefaultTextButton(
              submit: () => setState(
                () => widget.provider.sections.add(
                  SectionModel(
                    id: "id_section",
                    title: "",
                    lessons: List<LessonModel>.from([]),
                  ),
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
    );
  }
}

class AddSectionItem extends StatefulWidget {
  AddSectionItem({
    super.key,
    required this.order,
    required this.provider,
    required this.onDelete,
  });

  int order;
  final CreateCourseProvider provider;
  final Function()? onDelete;

  @override
  State<AddSectionItem> createState() => _AddSectionItemState();
}

class _AddSectionItemState extends State<AddSectionItem> {
  bool isEditing = false;
  final titleController = TextEditingController();
  final TextStyle sectionTitleStyle = AppStyles.subtitle1TextStyle.copyWith(
    fontWeight: FontWeight.w900,
    color: AppColors.neutral.shade700,
  );
  late SectionModel section;

  void toggle() => setState(() => isEditing = !isEditing);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    log("dispose create section");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    section = widget.provider.sections[widget.order];
    titleController.text = section.title;

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
                widget.provider.sections[widget.order].title =
                    titleController.text.trim();
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
