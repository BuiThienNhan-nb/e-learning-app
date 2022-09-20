import 'dart:developer' as logger;

import 'package:e_learning_app/bases/mobx/base_state.dart';
import 'package:e_learning_app/configs/routes.dart';
import 'package:e_learning_app/core/app/loading.dart';
import 'package:e_learning_app/features/auth/presentation/state/mobx/auth_store.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../bases/presentation/atoms/default_result_dialog.dart';
import '../../../../bases/presentation/atoms/link_text.dart';
import '../../../../bases/presentation/atoms/text_button.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/languages.dart';
import '../../../../configs/styles.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../../../utils/extensions/context_extension.dart';
import '../state/provider/auth_page_provider.dart';
import '../widgets/fb_gg_auth.dart';
import '../widgets/lang_switcher.dart';
import '../widgets/login_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AuthStore? authStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    authStore ??= GetIt.I<AuthStore>();
  }

  @override
  void dispose() {
    // logger.log("dispose");
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
            if (authStore!.state == BaseSate.loading) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AppLoading.showLoadingDialog(context);
              });
            }
            if (authStore!.state == BaseSate.error ||
                authStore!.errorMessage != null) {
              logger.log(authStore!.errorMessage ?? "Error");
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AppLoading.dismissLoadingDialog(context);
                showDialog(
                  context: context,
                  builder: (_) => DefaultResultDialog(
                    content: authStore!.errorMessage ??
                        LocaleKeys.serverUnexpectedError.tr(),
                    isError: true,
                  ),
                );
              });
            } else if (authStore!.state == BaseSate.loaded) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  AppLoading.dismissLoadingDialog(context);
                  GoRouter.of(context).go(AppRoutes.instance.home);
                },
              );
            }

            // Build content
            return BuildAuthPage(
              provider: provider,
              authStore: authStore!,
            );
          },
        ),
      ),
    );
  }
}

class BuildAuthPage extends StatelessWidget {
  const BuildAuthPage({
    Key? key,
    required this.provider,
    required this.authStore,
  }) : super(key: key);

  final AuthPageProvider provider;
  final AuthStore authStore;

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
              SizedBox(height: AppDimens.largeHeightDimens * 4),
              Center(
                child: SvgPicture.asset("assets/images/app_logo.svg"),
              ),
              SizedBox(height: AppDimens.extraLargeHeightDimens),
              Text(
                LocaleKeys.loginToYourAccount.tr(),
                textAlign: TextAlign.center,
                style: AppStyles.headline5TextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppDimens.extraLargeHeightDimens * 2),
              LoginForm(provider: provider),
              SizedBox(height: AppDimens.largeHeightDimens),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => logger.log("message"),
                  child: Text(
                    LocaleKeys.forgotPassword.tr(),
                    style: AppStyles.subtitle2TextStyle.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppDimens.extraLargeWidthDimens * 2),
              DefaultTextButton(
                submit: () {
                  final email = provider.emailController.text.trim();
                  final password = provider.passwordController.text.trim();

                  logger.log("$email $password");

                  authStore.signIn(email, password);
                },
                title: LocaleKeys.signIn.tr(),
              ),
              SizedBox(height: AppDimens.extraLargeWidthDimens),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimens.extraLargeWidthDimens,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.neutral.shade900,
                        height: 30.h,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimens.largeWidthDimens,
                      ),
                      child: Text(
                        LocaleKeys.orContinueWith.tr(),
                        style: context.textTheme.titleMedium?.copyWith(
                          color: AppColors.neutral.shade600,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.neutral.shade900,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppDimens.largeHeightDimens),
              SocialAuthentication(provider: provider),
              SizedBox(height: AppDimens.largeHeightDimens),
              Center(
                child: LinkText(
                  contentText1: LocaleKeys.dontHaveAccount.tr(),
                  contentText2: "  ${LocaleKeys.signUp.tr()}",
                  onTap1: () {},
                  onTap2: () => logger.log("message"),
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
