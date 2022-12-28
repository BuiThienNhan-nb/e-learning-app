import 'dart:io';

import 'package:e_learning_app/bases/presentation/atoms/network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../bases/presentation/atoms/dropdown_button.dart';
import '../../../../../bases/presentation/atoms/text_form_field.dart';
import '../../../../../configs/colors.dart';
import '../../../../../configs/dimens.dart';
import '../../states/provider/update_course_provider.dart';

class UpdateCourseInformation extends StatelessWidget {
  const UpdateCourseInformation({
    super.key,
    // required this.course,
    // required this.provider,
    required this.onCourseInformationSaved,
  });

  // final CourseModel course;
  // final UpdateCourseProvider provider;
  final Function()? onCourseInformationSaved;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<UpdateCourseProvider>();

    final items = [
      "3D Design",
      "Architecture",
      "Grammar",
      "Speaking",
      "Sales",
      "Writing",
      "Digital Marketing",
      "Business",
    ];
    int selectedIndex = items
        .indexOf(context.watch<UpdateCourseProvider>().course.category.first);

    Future<String> pickImage() async {
      XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (xFile == null) return "";
      provider.course.image = xFile.path;
      provider.isUpdateImage = true;
      return xFile.path;
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Update variables
          provider.updateCourseVariable();
          onCourseInformationSaved!();
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
        child: Form(
          key: provider.key,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppDimens.largeHeightDimens,
              horizontal: AppDimens.largeWidthDimens,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: pickImage,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppDimens.itemRadius),
                    child: Container(
                      height: AppDimens.extraLargeHeightDimens * 8,
                      width: AppDimens.extraLargeWidthDimens * 8,
                      color: AppColors.neutral.shade400,
                      child: provider.course.image == ""
                          ? Image.asset(
                              "assets/icons/camera_icon.png",
                              color: AppColors.primaryColor,
                            )
                          : provider.isUpdateImage
                              ? Image.file(
                                  File(
                                    context
                                        .watch<UpdateCourseProvider>()
                                        .course
                                        .image,
                                  ),
                                  fit: BoxFit.cover,
                                )
                              : DefaultNetworkImage(
                                  imageUrl: provider.course.image,
                                  blurHash: "L6Du;]^%DlTw00Io%1i_00XT~Umm",
                                  height: AppDimens.extraLargeHeightDimens * 8,
                                  width: AppDimens.extraLargeWidthDimens * 8,
                                  shape: BoxShape.rectangle,
                                ),
                    ),
                  ),
                ),
                SizedBox(height: AppDimens.largeHeightDimens),
                DefaultDropdownButton(
                  labelText: "Category",
                  prefixIcon: null,
                  selectedIndex: selectedIndex,
                  items: items,
                  onChanged: (val) {
                    selectedIndex = val;
                    provider.category.text = items[selectedIndex];
                  },
                ),
                SizedBox(height: AppDimens.largeHeightDimens),
                DefaultTextFormField(
                  labelText: "Course Title",
                  controller: provider.title,
                  hintText: "Name this course...",
                  maxLines: 2,
                ),
                SizedBox(height: AppDimens.largeHeightDimens),
                DefaultTextFormField(
                  labelText: "About this Course",
                  controller: provider.description,
                  hintText: "Course Brief...",
                  maxLines: 5,
                ),
                SizedBox(height: AppDimens.largeHeightDimens),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
