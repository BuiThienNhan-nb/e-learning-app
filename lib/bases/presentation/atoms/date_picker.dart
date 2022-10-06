import 'package:e_learning_app/bases/presentation/atoms/text_form_field.dart';
import 'package:e_learning_app/configs/formats.dart';
import 'package:e_learning_app/generated/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  DatePicker({
    Key? key,
    required this.controller,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final initDate = controller.text == ""
        ? DateTime(2001, 9, 25)
        : AppFormats.instance.formatDay.parse(controller.text);

    void pickDate() async {
      final pickDate = await showDatePicker(
        context: context,
        initialDate: initDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        builder: (context, child) => child!,
      );
      if (pickDate == null) return;
      controller.text = AppFormats.instance.formatDay.format(pickDate);
    }

    return DefaultTextFormField(
      labelText: LocaleKeys.birthday.tr(),
      controller: controller,
      prefixIcon: "assets/icons/calendar_icon.png",
      readOnly: true,
      onTap: pickDate,
      validator: validator,
    );
  }
}
