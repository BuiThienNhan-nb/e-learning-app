import 'package:flutter/material.dart';

import '../../../generated/translations/locale_keys.g.dart';
import 'text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  String? labelText;
  String? Function(String?)? validator;

  PasswordTextFormField({
    Key? key,
    required this.controller,
    this.labelText,
    this.validator,
  }) : super(key: key);

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool togglePassword = true;
  late Image suffixIcon;

  @override
  Widget build(BuildContext context) {
    suffixIcon = togglePassword
        ? Image.asset("assets/icons/password_hide_icon.png")
        : Image.asset("assets/icons/password_show_icon.png");

    return DefaultTextFormField(
      labelText: widget.labelText ?? LocaleKeys.password.tr(),
      controller: widget.controller,
      prefixIcon: "assets/icons/lock_icon.png",
      suffixIcon: togglePassword
          ? "assets/icons/password_hide_icon.png"
          : "assets/icons/password_show_icon.png",
      obscureText: togglePassword,
      onSuffixIconTap: () => setState(() => togglePassword = !togglePassword),
      validator: widget.validator,
    );
  }
}
