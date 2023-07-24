import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../bases/presentation/atoms/dropdown_button.dart';
import '../../../../../bases/presentation/atoms/text_form_field.dart';
import '../../../../../configs/colors.dart';
import '../../../../../configs/dimens.dart';
import '../../states/provider/create_course_provider.dart';

class AddGeneralInformationContent extends StatefulWidget {
  const AddGeneralInformationContent({
    super.key,
    required this.provider,
  });

  final CreateCourseProvider provider;

  @override
  State<AddGeneralInformationContent> createState() =>
      _AddGeneralInformationContentState();
}

class _AddGeneralInformationContentState
    extends State<AddGeneralInformationContent> {
  final items = [
    "3D Design",
    "Architecture",
    "Grammar",
    "Speaking",
    "Sales",
    "Writing",
    "Digital Marketing",
    "Business",
    "Coding",
  ];
  int selectedIndex = 0;

  Future<String> _pickImage() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile == null) return "";
    widget.provider.imageSource = xFile.path;
    setState(() {});
    return xFile.path;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // if (widget.provider.imageSource != "") {
        //   final File file = File(widget.provider.imageSource.trim());
        //   file.delete();
        // }
        return true;
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: widget.provider.key,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppDimens.largeHeightDimens,
              horizontal: AppDimens.largeWidthDimens,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppDimens.itemRadius),
                    child: Container(
                      height: AppDimens.extraLargeHeightDimens * 8,
                      width: AppDimens.extraLargeWidthDimens * 8,
                      color: AppColors.neutral.shade400,
                      child: widget.provider.imageSource == ""
                          ? Image.asset(
                              "assets/icons/camera_icon.png",
                              color: AppColors.primaryColor,
                            )
                          : Image.file(
                              File(widget.provider.imageSource),
                              fit: BoxFit.cover,
                            ),
                      // child: Center(
                      //   child: FutureBuilder<String>(
                      //     future: _pickImage(),
                      //     builder: (context, snapshot) {
                      //       if (snapshot.connectionState == ConnectionState.done) {
                      //         if (snapshot.hasError) {
                      //           Image.asset(name)
                      //         }
                      //         return Container();
                      //       }
                      //       return Image.asset(
                      //         "assets/icons/camera_icon.png",
                      //         color: AppColors.primaryColor,
                      //       );
                      //     },
                      //   ),
                      // ),
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
                    widget.provider.category.text = items[selectedIndex];
                  },
                ),
                SizedBox(height: AppDimens.largeHeightDimens),
                DefaultTextFormField(
                  labelText: "Course Title",
                  controller: widget.provider.title,
                  hintText: "Name this course...",
                  maxLines: 2,
                ),
                SizedBox(height: AppDimens.largeHeightDimens),
                DefaultTextFormField(
                  labelText: "About this Course",
                  controller: widget.provider.description,
                  hintText: "Course Brief...",
                  maxLines: 5,
                ),
                SizedBox(height: AppDimens.largeHeightDimens),
                // Row(
                //   children: [
                //     Checkbox(
                //       value: widget.provider.isPremium,
                //       onChanged: (value) => setState(() {
                //         widget.provider.isPremium = value!;
                //       }),
                //       activeColor: AppColors.primaryColor,
                //     ),
                //     const Text("Just for Premium User"),
                //   ],
                // ),
                // DefaultTextFormField(
                //   labelText: "Course Image",
                //   controller: provider.imageSource,
                //   hintText: "Pick an Image...",
                //   readOnly: true,
                //   onTap: () async {
                //     await _pickImage()
                //         .then((value) => provider.imageSource.text = value);
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
