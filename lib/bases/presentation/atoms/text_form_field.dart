import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:flutter/material.dart';

import '../../../configs/dimens.dart';

class DefaultTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  Function()? onTap;
  bool readOnly = false;
  String? prefixIcon;
  String? suffixIcon;
  bool obscureText = false;
  String? hintText;
  void Function(bool)? onFocus;
  void Function()? onSuffixIconTap;
  TextInputType? textInputType;
  String? Function(String?)? validator;

  DefaultTextFormField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.prefixIcon,
    this.readOnly = false,
    this.obscureText = false,
    this.suffixIcon,
    this.onTap,
    this.hintText,
    this.onFocus,
    this.onSuffixIconTap,
    this.textInputType,
    this.validator,
  }) : super(key: key);

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  FocusNode textFieldFocus = FocusNode();
  Color fillColor = AppColors.neutral.shade200;
  Color iconColor = AppColors.neutral.shade400;

  @override
  void initState() {
    textFieldFocus.addListener(() {
      if (widget.onFocus != null) {
        widget.onFocus!(textFieldFocus.hasFocus);
      }
      if (textFieldFocus.hasFocus) {
        setState(() {
          fillColor = AppColors.subThemeColor;
          iconColor = AppColors.primaryColor;
        });
      } else {
        setState(() {
          fillColor = AppColors.neutral.shade200;
          iconColor = AppColors.neutral.shade400;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: textFieldFocus,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      obscureText: widget.obscureText,
      keyboardType: widget.textInputType,
      validator: widget.validator,
      style: AppStyles.subtitle1TextStyle.copyWith(
        color: AppColors.blackColor,
        fontWeight: FontWeight.w900,
      ),
      decoration: InputDecoration(
        errorMaxLines: 2,
        hintText: widget.hintText,
        hintStyle: AppStyles.subtitle1TextStyle.copyWith(
          fontWeight: FontWeight.w500,
        ),
        labelText: widget.labelText,
        labelStyle: AppStyles.subtitle1TextStyle.copyWith(
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: widget.prefixIcon == null
            ? null
            : Image.asset(
                widget.prefixIcon!,
                color: iconColor,
              ),
        prefixIconColor: fillColor,
        suffixIcon: GestureDetector(
          onTap: widget.onSuffixIconTap,
          child: widget.suffixIcon != null
              ? Image.asset(
                  widget.suffixIcon!,
                  color: iconColor,
                )
              : const SizedBox.shrink(),
        ),
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
