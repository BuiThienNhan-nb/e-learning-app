import 'package:e_learning_app/bases/presentation/atoms/date_picker.dart';
import 'package:e_learning_app/bases/presentation/atoms/dropdown_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../bases/presentation/atoms/password_text_form_field.dart';
import '../../../../../bases/presentation/atoms/text_form_field.dart';
import '../../../../../configs/dimens.dart';
import '../../../../../configs/validations.dart';
import '../../../../../generated/translations/locale_keys.g.dart';
import '../../../sign_in/presentation/state/provider/auth_page_provider.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final AuthPageProvider provider;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: provider.signUpKey,
      child: Column(
        children: [
          DefaultTextFormField(
            labelText: LocaleKeys.name.tr(),
            controller: provider.nameController,
            prefixIcon: "assets/icons/user_icon.png",
            hintText: LocaleKeys.name.tr(),
            textInputType: TextInputType.name,
            validator: (value) => AppValidations.instance.nameValidator(value!),
          ),
          SizedBox(height: AppDimens.extraLargeHeightDimens),
          DefaultTextFormField(
            labelText: LocaleKeys.email.tr(),
            controller: provider.emailController,
            prefixIcon: "assets/icons/mail_icon.png",
            hintText: LocaleKeys.email.tr(),
            textInputType: TextInputType.emailAddress,
            validator: (value) =>
                AppValidations.instance.emailValidator(value!),
          ),
          SizedBox(height: AppDimens.extraLargeHeightDimens),
          PasswordTextFormField(
            controller: provider.passwordController,
            validator: (value) =>
                AppValidations.instance.passwordValidator(value!),
          ),
          SizedBox(height: AppDimens.extraLargeHeightDimens),
          PasswordTextFormField(
            labelText: LocaleKeys.confirmPassword.tr(),
            controller: provider.confirmPasswordController,
            validator: (confirmPassword) =>
                AppValidations.instance.confirmPasswordValidator(
              confirmPassword!,
              provider.passwordController.text.trim(),
            ),
          ),
          SizedBox(height: AppDimens.extraLargeHeightDimens),
          DatePicker(controller: provider.datePickerController),
          SizedBox(height: AppDimens.extraLargeHeightDimens),
          DefaultDropdownButton(
            labelText: LocaleKeys.gender.tr(),
            prefixIcon: "assets/icons/gender_icon.png",
            items: [
              LocaleKeys.ma.tr(),
              LocaleKeys.fe.tr(),
              LocaleKeys.ot.tr(),
            ],
            provider: provider,
          ),
        ],
      ),
    );
  }
}
