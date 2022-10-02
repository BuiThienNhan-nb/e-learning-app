import 'package:e_learning_app/features/auth/sign_in/presentation/state/provider/auth_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/colors.dart';
import '../../../configs/dimens.dart';
import '../../../configs/styles.dart';

class DefaultDropdownButton extends StatefulWidget {
  DefaultDropdownButton({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    this.onTap,
    this.hintText,
    this.onFocus,
    required this.provider,
    required this.items,
  }) : super(key: key);

  final String labelText;
  Function()? onTap;
  final String prefixIcon;
  String? hintText;
  void Function(bool)? onFocus;
  List<String> items;
  AuthPageProvider provider;

  @override
  State<DefaultDropdownButton> createState() => _DefaultDropdownButtonState();
}

class _DefaultDropdownButtonState extends State<DefaultDropdownButton> {
  FocusNode textFieldFocus = FocusNode();
  Color fillColor = AppColors.neutral.shade200;
  Color iconColor = AppColors.neutral.shade400;
  late String selectedValue;
  List<DropdownMenuItem<String>> items = [];

  @override
  void initState() {
    textFieldFocus.addListener(() {
      if (widget.onFocus != null) {
        widget.onFocus!(textFieldFocus.hasFocus);
      }
      if (textFieldFocus.hasFocus) {
        setState(() {
          fillColor = AppColors.secondaryColor;
          iconColor = AppColors.primaryColor;
        });
      } else {
        setState(() {
          fillColor = AppColors.neutral.shade200;
          iconColor = AppColors.neutral.shade400;
        });
      }
    });

    // Init required values for dropDownButton
    selectedValue = widget.items.first;
    for (var element in widget.items) {
      items.add(
        DropdownMenuItem(
          value: element,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimens.itemRadius),
            ),
            child: Text(element),
          ),
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      items: items,
      onChanged: (value) {
        setState(() {
          widget.provider.gender = value!;
          selectedValue = value;
        });
      },
      value: selectedValue,
      focusNode: textFieldFocus,
      onTap: widget.onTap,
      style: AppStyles.subtitle1TextStyle.copyWith(
        color: AppColors.blackColor,
        fontWeight: FontWeight.w900,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppStyles.subtitle1TextStyle.copyWith(
          fontWeight: FontWeight.w500,
        ),
        labelText: widget.labelText,
        labelStyle: AppStyles.subtitle1TextStyle.copyWith(
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: Image.asset(
          widget.prefixIcon,
          height: 2.h,
          width: 2.w,
          color: iconColor,
        ),
        prefixIconColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.itemRadius),
          borderSide: BorderSide(
            color: AppColors.neutral.shade200,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.itemRadius),
          borderSide: BorderSide(
            color: AppColors.neutral.shade200,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.itemRadius),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.itemRadius),
          borderSide: BorderSide(
            color: AppColors.neutral.shade200,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.itemRadius),
          borderSide: BorderSide(
            color: AppColors.neutral.shade200,
          ),
        ),
        filled: true,
        fillColor: fillColor,
      ),
    );
  }
}
