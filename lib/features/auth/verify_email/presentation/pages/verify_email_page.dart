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
import '../states/mobx/verify_email_store.dart';
import '../states/providers/verify_email_provider.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = GetIt.I<VerifyEmailProvider>();
    final store = GetIt.I<VerifyEmailStore>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: const DefaultAppBar(title: "Verify Email"),
          body: Observer(
            builder: (context) {
              if (store.getCodeState == BaseSate.loading) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  AppLoading.showLoadingDialog(context);
                });
              }
              if (store.getCodeState == BaseSate.error ||
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
              } else if (store.getCodeState == BaseSate.loaded) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) {
                    AppLoading.dismissLoadingDialog(context);
                    GoRouter.of(context).go(GetIt.I<AppRoutes>().signIn);
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
                          key: provider.key,
                          child: DefaultTextFormField(
                            labelText: "Verify Email Token",
                            controller: provider.token,
                            prefixIcon: "assets/icons/user_icon.png",
                            hintText: LocaleKeys.email.tr(),
                            textInputType: TextInputType.emailAddress,
                            validator: (value) =>
                                AppValidations.instance.indentityCode(value!),
                          ),
                        ),
                      ),
                    ),
                    DefaultTextButton(
                      submit: () async {
                        // Check form is valid
                        if (provider.key.currentState!.validate()) {
                          final token = provider.token.text.trim();

                          store.verifyEmail(token);
                        }
                      },
                      title: "Get Verify Token via Email",
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
