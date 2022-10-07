import 'dart:developer' as logger;

import 'package:e_learning_app/configs/formats.dart';
import 'package:e_learning_app/core/app/values.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../bases/mobx/base_state.dart';
import '../../../../../bases/presentation/atoms/default_result_dialog.dart';
import '../../../../../bases/presentation/atoms/link_text.dart';
import '../../../../../bases/presentation/atoms/text_button.dart';
import '../../../../../configs/dimens.dart';
import '../../../../../configs/languages.dart';
import '../../../../../configs/routes.dart';
import '../../../../../configs/styles.dart';
import '../../../../../core/app/loading.dart';
import '../../../../../generated/translations/locale_keys.g.dart';
import '../../../sign_in/presentation/state/provider/auth_page_provider.dart';
import '../../../sign_in/presentation/widgets/lang_switcher.dart';
import '../state/mobx/sign_up_store.dart';
import '../widgets/sign_up_form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignUpStore? signUpStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    signUpStore ??= GetIt.I<SignUpStore>();
  }

  @override
  void dispose() {
    logger.log("dispose sign up");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = GetIt.I<AuthPageProvider>();

    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) {
            // Trigger UI
            if (signUpStore!.state == BaseSate.loading) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AppLoading.showLoadingDialog(context);
              });
            }
            if (signUpStore!.state == BaseSate.error ||
                signUpStore!.errorMessage != null) {
              logger.log(signUpStore!.errorMessage ?? "Error");
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AppLoading.dismissLoadingDialog(context);
                showDialog(
                  context: context,
                  builder: (_) => DefaultResultDialog(
                    content: signUpStore!.errorMessage ??
                        LocaleKeys.serverUnexpectedError.tr(),
                    isError: true,
                  ),
                );
              });
            } else if (signUpStore!.state == BaseSate.loaded) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  AppLoading.dismissLoadingDialog(context);
                  GoRouter.of(context).go(AppRoutes.instance.home);
                },
              );
            }

            // Build content
            return BuildSignUpPage(
              provider: provider,
              authStore: signUpStore!,
            );
          },
        ),
      ),
    );
  }
}

class BuildSignUpPage extends StatelessWidget {
  const BuildSignUpPage({
    Key? key,
    required this.provider,
    required this.authStore,
  }) : super(key: key);

  final AuthPageProvider provider;
  final SignUpStore authStore;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.extraLargeWidthDimens,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: AppDimens.largeHeightDimens),
              Align(
                alignment: Alignment.centerRight,
                child: LanguageSwitcher(
                  onTap: () async => await context.setLocale(
                    context.locale.languageCode ==
                            AppLanguages.supportedLocales.first.languageCode
                        ? AppLanguages.supportedLocales.last
                        : AppLanguages.supportedLocales.first,
                  ),
                ),
              ),
              SizedBox(height: AppDimens.extraLargeHeightDimens * 2),
              Text(
                LocaleKeys.createNewAccount.tr(),
                textAlign: TextAlign.center,
                style: AppStyles.headline5TextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppDimens.extraLargeHeightDimens),
              SignUpForm(provider: provider),
              SizedBox(height: AppDimens.largeHeightDimens),
              DefaultTextButton(
                submit: () {
                  if (provider.signUpKey.currentState!.validate()) {
                    authStore.signUp(
                      name: provider.nameController.text.trim(),
                      email: provider.emailController.text.trim(),
                      password: provider.passwordController.text.trim(),
                      phoneNumber: provider.phoneNumberController.text.trim(),
                      birthday: AppFormats.instance.formatDay
                          .parse(provider.datePickerController.text),
                      gender: AppValues
                          .instance.appSupportedGender[provider.genderIndex],
                      role: AppValues.instance.title[provider.titleIndex],
                    );
                  }
                },
                title: LocaleKeys.signUp.tr(),
              ),
              SizedBox(height: AppDimens.extraLargeWidthDimens),
              Center(
                child: LinkText(
                  contentText1: LocaleKeys.alreadyHaveAccount.tr(),
                  contentText2: "  ${LocaleKeys.signIn.tr()}",
                  onTap1: () {},
                  onTap2: () => GoRouter.of(context).pop(),
                ),
              ),
              SizedBox(height: AppDimens.mediumHeightDimens),
            ],
          ),
        ),
      ),
    );
  }
}
