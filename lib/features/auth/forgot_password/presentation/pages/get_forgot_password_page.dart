import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../bases/mobx/base_state.dart';
import '../../../../../bases/presentation/atoms/default_app_bar.dart';
import '../../../../../bases/presentation/atoms/default_result_dialog.dart';
import '../../../../../bases/presentation/atoms/text_button.dart';
import '../../../../../bases/presentation/atoms/text_form_field.dart';
import '../../../../../configs/dimens.dart';
import '../../../../../configs/routes.dart';
import '../../../../../configs/validations.dart';
import '../../../../../core/app/loading.dart';
import '../../../../../generated/translations/locale_keys.g.dart';
import '../state/mobx/forgot_password_store.dart';
import '../state/providers/get_forgot_password_code_provider.dart';

class GetForgotPasswordPage extends StatelessWidget {
  const GetForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = GetIt.I<GetForgotPasswordCodeProvider>();
    final store = GetIt.I<ForgotPasswordStore>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const DefaultAppBar(title: "Forgot Password Code"),
        body: Observer(
          builder: (context) {
            if (store.getCodeState == BaseSate.loading) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AppLoading.showLoadingDialog(context);
              });
            }
            if (store.getCodeState == BaseSate.error ||
                store.errorMessage != null) {
              log(store.errorMessage ?? "Error");
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
            } else if (store.getCodeState == BaseSate.loaded) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  AppLoading.dismissLoadingDialog(context);
                  GoRouter.of(context).push(GetIt.I<AppRoutes>().resetPassword);
                },
              );
            }

            return Padding(
              padding: EdgeInsets.all(AppDimens.largeWidthDimens),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: Form(
                        key: provider.emailKey,
                        child: DefaultTextFormField(
                          labelText: LocaleKeys.email.tr(),
                          controller: provider.emailController,
                          prefixIcon: "assets/icons/mail_icon.png",
                          hintText: LocaleKeys.email.tr(),
                          textInputType: TextInputType.emailAddress,
                          validator: (value) =>
                              AppValidations.instance.emailValidator(value!),
                        ),
                      ),
                    ),
                  ),
                  DefaultTextButton(
                    submit: () async {
                      // Check form is valid
                      if (provider.emailKey.currentState!.validate()) {
                        final email = provider.emailController.text.trim();

                        store.getCode(email);
                      }
                    },
                    title: "Get Token via Email",
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
