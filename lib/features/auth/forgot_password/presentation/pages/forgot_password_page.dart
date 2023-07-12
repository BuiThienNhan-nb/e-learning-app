import 'dart:developer';

import 'package:e_learning_app/bases/presentation/atoms/default_app_bar.dart';
import 'package:e_learning_app/bases/presentation/atoms/text_button.dart';
import 'package:e_learning_app/bases/presentation/atoms/text_form_field.dart';
import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/configs/dimens.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:e_learning_app/generated/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../bases/mobx/base_state.dart';
import '../../../../../bases/presentation/atoms/default_result_dialog.dart';
import '../../../../../bases/presentation/atoms/password_text_form_field.dart';
import '../../../../../configs/routes.dart';
import '../../../../../configs/validations.dart';
import '../../../../../core/app/loading.dart';
import '../state/mobx/forgot_password_store.dart';
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
    final store = GetIt.I<ForgotPasswordStore>();

    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: const DefaultAppBar(title: "Reset Password"),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.extraLargeWidthDimens,
            ),
            child: Observer(
              builder: (context) {
                if (store.resetPasswordState == BaseSate.loading) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    AppLoading.showLoadingDialog(context);
                  });
                }
                if (store.resetPasswordState == BaseSate.error ||
                    store.errorMessage != null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    AppLoading.dismissLoadingDialog(context);
                    showDialog(
                      context: context,
                      builder: (_) => DefaultResultDialog(
                        content: store.errorMessage ??
                            LocaleKeys.serverUnexpectedError.tr(),
                        isError: true,
                      ),
                    );
                  });
                } else if (store.resetPasswordState == BaseSate.loaded) {
                  WidgetsBinding.instance.addPostFrameCallback(
                    (_) {
                      AppLoading.dismissLoadingDialog(context);
                      // provider.dispose();
                      GoRouter.of(context).go(GetIt.I<AppRoutes>().signIn);
                    },
                  );
                }

                return Form(
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
                          labelText: LocaleKeys.resetPasswordToken.tr(),
                          controller: provider.tokenController,
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
                              final String newPasswordToken =
                                  provider.tokenController.text.trim();
                              final String newPassword =
                                  provider.passwordController.text.trim();
                              store.resetPassword(
                                newPasswordToken,
                                newPassword,
                              );
                            }
                          },
                          title: LocaleKeys.resetPassword.tr(),
                        ),
                        SizedBox(height: AppDimens.mediumHeightDimens),
                        DefaultTextButton(
                          submit: () {
                            if (provider.passwordKey.currentState!.validate()) {
                              // Do resend email logic
                              print("Resend Email clicked!");
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
