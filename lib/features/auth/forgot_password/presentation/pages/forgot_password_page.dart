import 'dart:developer';

import 'package:e_learning_app/bases/presentation/atoms/text_button.dart';
import 'package:e_learning_app/bases/presentation/atoms/text_form_field.dart';
import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/configs/dimens.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:e_learning_app/generated/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../bases/presentation/atoms/password_text_form_field.dart';
import '../../../../../configs/validations.dart';
import '../state/providers/forgot_password_provider.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final provider = GetIt.I<ForgotPasswordPageProvider>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            LocaleKeys.forgotPassword.tr(),
            style: AppStyles.headline5TextStyle.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          automaticallyImplyLeading: true,
          centerTitle: true,
          actionsIconTheme: const IconThemeData(
            color: AppColors.whiteColor,
          ),
          iconTheme: const IconThemeData(
            color: AppColors.whiteColor,
          ),
          toolbarHeight: AppDimens.extraLargeHeightDimens * 3,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.extraLargeWidthDimens,
          ),
          child: Form(
            key: provider.passwordKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LocaleKeys.sendEmailMessage.tr(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppDimens.extraLargeHeightDimens * 3),
                  DefaultTextFormField(
                    labelText: LocaleKeys.identityCode.tr(),
                    controller: provider.idCodeController,
                    prefixIcon: "assets/icons/user_icon.png",
                    validator: (value) =>
                        AppValidations.instance.indentityCode(value!),
                  ),
                  SizedBox(height: AppDimens.extraLargeHeightDimens),
                  PasswordTextFormField(
                    controller: provider.passwordController,
                    validator: (value) =>
                        AppValidations.instance.passwordValidator(value!),
                  ),
                  SizedBox(height: AppDimens.extraLargeHeightDimens),
                  PasswordTextFormField(
                    controller: provider.confirmPasswordController,
                    labelText: LocaleKeys.confirmPassword.tr(),
                    validator: (confirmPassword) =>
                        AppValidations.instance.confirmPasswordValidator(
                      confirmPassword!,
                      provider.passwordController.text.trim(),
                    ),
                  ),
                  SizedBox(height: AppDimens.extraLargeHeightDimens * 2),
                  DefaultTextButton(
                    submit: () {
                      if (provider.passwordKey.currentState!.validate()) {
                        // Do reset password logic
                        log("Reset password clicked!");
                      }
                    },
                    title: LocaleKeys.resetPassword.tr(),
                  ),
                  SizedBox(height: AppDimens.mediumHeightDimens),
                  DefaultTextButton(
                    submit: () {
                      if (provider.passwordKey.currentState!.validate()) {
                        // Do resend email logic
                        log("Resend Email clicked!");
                      }
                    },
                    title: LocaleKeys.resendEmail.tr(),
                    backgroundColor: AppColors.subThemeColor,
                    titleStyle: AppStyles.headline6TextStyle.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
