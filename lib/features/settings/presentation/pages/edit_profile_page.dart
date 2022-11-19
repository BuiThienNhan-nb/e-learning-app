import 'dart:developer';

import 'package:e_learning_app/bases/presentation/atoms/password_text_form_field.dart';
import 'package:e_learning_app/bases/presentation/atoms/text_button.dart';
import 'package:e_learning_app/bases/presentation/atoms/text_form_field.dart';
import 'package:e_learning_app/configs/dimens.dart';
import 'package:e_learning_app/generated/translations/locale_keys.g.dart';
import 'package:e_learning_app/utils/extensions/list_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../bases/presentation/atoms/date_picker.dart';
import '../../../../bases/presentation/atoms/dropdown_button.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/validations.dart';
import '../../../../core/app/values.dart';
import '../states/provider/settings_page_provider.dart';
import '../widgets/setting_app_bar.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  Widget build(BuildContext context) {
    final provider = GetIt.I<SettingsPageProvider>();
    log(userId);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: const SettingAppBar(title: "Edit Profile"),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(AppDimens.largeWidthDimens),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DefaultTextFormField(
                  labelText: LocaleKeys.name.tr(),
                  controller: provider.nameController,
                ),
                SizedBox(height: AppDimens.largeHeightDimens),
                DatePicker(
                  controller: provider.datePickerController,
                  validator: (value) =>
                      AppValidations.instance.birthdayValidator(value!),
                ),
                SizedBox(height: AppDimens.largeHeightDimens),
                DefaultTextFormField(
                  labelText: LocaleKeys.email.tr(),
                  controller: TextEditingController(
                      text: "buithiennhan250901@gmail.com "),
                  readOnly: true,
                ),
                SizedBox(height: AppDimens.largeHeightDimens),
                PasswordTextFormField(
                  readOnly: true,
                  controller: TextEditingController(text: "Nhan2509@"),
                  onSuffixIconTap: () => log("on change password tap"),
                  suffixIconSource: "assets/icons/key_icon.png",
                ),
                SizedBox(height: AppDimens.largeHeightDimens),
                DefaultDropdownButton(
                  labelText: LocaleKeys.gender.tr(),
                  prefixIcon: "assets/icons/gender_icon.png",
                  items:
                      AppValues.instance.appSupportedGender.toCurrentLocale(),
                  selectedIndex: provider.genderIndex,
                  onChanged: (index) => provider.genderIndex = index,
                ),
                SizedBox(height: AppDimens.largeHeightDimens),
                DefaultDropdownButton(
                  labelText: LocaleKeys.title.tr(),
                  prefixIcon: "assets/icons/briefcase_icon.png",
                  items: AppValues.instance.title.toCurrentLocale(),
                  selectedIndex: 0,
                  onChanged: (index) {},
                  disable: true,
                ),
                SizedBox(height: AppDimens.extraLargeHeightDimens),
                Container(
                  padding: EdgeInsets.all(AppDimens.mediumHeightDimens),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppDimens.extraItemRadius),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.secondaryColor.withOpacity(0.3),
                        blurRadius: AppDimens.mediumHeightDimens,
                        offset: const Offset(1, 4),
                        blurStyle: BlurStyle.normal,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: DefaultTextButton(
                    submit: () {},
                    title: "Update",
                  ),
                ),
                SizedBox(height: AppDimens.mediumHeightDimens),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
