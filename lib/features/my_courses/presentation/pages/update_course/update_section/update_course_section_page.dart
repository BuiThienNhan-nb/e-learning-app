import 'package:e_learning_app/features/my_courses/presentation/pages/update_course/update_section/update_section_lessons_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../bases/presentation/atoms/text_button.dart';
import '../../../../../../bases/presentation/atoms/text_form_field.dart';
import '../../../../../../configs/colors.dart';
import '../../../../../../configs/dimens.dart';
import '../../../../../../configs/styles.dart';
import '../../../../../home/domain/entities/section_model.dart';
import '../../../states/mobx/update_course_store.dart';
import '../../../states/provider/update_course_provider.dart';

class UpdateCourseSectionPage extends StatelessWidget {
  const UpdateCourseSectionPage({
    super.key,
    required this.createSection,
    required this.deleteSection,
  });

  final Function() createSection;
  final Function(String, int) deleteSection;

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
                    vertical: AppDimens.mediumHeightDimens,
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => MultiProvider(
                          providers: [
                            Provider<UpdateCourseStore>.value(
                              value: context.read<UpdateCourseStore>(),
                            ),
                            ChangeNotifierProvider<UpdateCourseProvider>.value(
                              value: provider,
                            ),
                          ],
                          child: UpdateSectionLessonsPage(
                            section: provider.course.section[index],
                          ),
                        ),
                      ),
                    ),
                    child: UpdateSectionItem(
                      order: index,
                      onDelete: () => deleteSection(
                        provider.course.section[index].id,
                        index,
                      ),
                      // onDelete: () => provider.deleteSectionAtIndex(index),
                      section: provider.course.section[index],
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppDimens.largeHeightDimens),
              DefaultTextButton(
                submit: createSection,
                /*submit: () {
                  provider.addSection(
                    SectionModel(
                      id: "id_section",
                      title: "",
                      lessons: List<LessonModel>.from([]),
                      order: provider.course.section.length + 1,
                    ),
                  );
                },*/
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

class UpdateSectionItem extends StatelessWidget {
  const UpdateSectionItem({
    super.key,
    required this.order,
    required this.section,
    required this.onDelete,
  });

  final int order;
  final SectionModel section;
  final Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    final TextStyle sectionTitleStyle = AppStyles.subtitle1TextStyle.copyWith(
      fontWeight: FontWeight.w900,
      color: AppColors.neutral.shade700,
    );

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
            child: Text(
              "Section ${order + 1} - ${section.title}",
              style: sectionTitleStyle,
            ),
          ),
          SizedBox(width: AppDimens.mediumWidthDimens),
          InkWell(
            onTap: onDelete,
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

class UpdateSectionItems extends StatefulWidget {
  UpdateSectionItems({
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
  State<UpdateSectionItems> createState() => _UpdateSectionItemsState();
}

class _UpdateSectionItemsState extends State<UpdateSectionItems> {
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
