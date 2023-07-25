import 'package:e_learning_app/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../bases/mobx/base_state.dart';
import '../../../../../bases/presentation/atoms/default_result_dialog.dart';
import '../../../../../bases/presentation/atoms/link_text.dart';
import '../../../../../bases/presentation/atoms/text_button.dart';
import '../../../../../configs/colors.dart';
import '../../../../../configs/dimens.dart';
import '../../../../../configs/languages.dart';
import '../../../../../configs/routes.dart';
import '../../../../../configs/styles.dart';
import '../../../../../core/app/loading.dart';
import '../../../../../core/app/provider.dart';
import '../../../../../generated/translations/locale_keys.g.dart';
import '../../../../../utils/extensions/context_extension.dart';
import '../state/mobx/sign_in_store.dart';
import '../state/provider/auth_page_provider.dart';
import '../widgets/fb_gg_auth.dart';
import '../widgets/lang_switcher.dart';
import '../widgets/login_form.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  SignInStore? signInStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    signInStore ??= GetIt.I<SignInStore>();
  }

  @override
  void dispose() {
    print("dispose sign in");
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
            if (signInStore!.state == BaseSate.loading) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AppLoading.showLoadingDialog(context);
              });
            }
            if (signInStore!.state == BaseSate.error ||
                signInStore!.errorMessage != null) {
              debugPrint(
                  'SignIn Error: ${signInStore!.errorMessage.toString()}');
              if (signInStore!.errorMessage
                      ?.compareTo(AppConstants.emailUnVerify) ==
                  0) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  GoRouter.of(context).push(GetIt.I<AppRoutes>().verifyEmail);
                });
              } else {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  AppLoading.dismissLoadingDialog(context);
                  showDialog(
                    context: context,
                    builder: (_) => DefaultResultDialog(
                      content: signInStore!.errorMessage ??
                          LocaleKeys.serverUnexpectedError.tr(),
                      isError: true,
                    ),
                  );
                });
              }
            } else if (signInStore!.state == BaseSate.loaded) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  GetIt.I<AppProvider>().user = signInStore!.userInfo!;
                  AppLoading.dismissLoadingDialog(context);
                  provider.dispose();
                  GoRouter.of(context).go(GetIt.I<AppRoutes>().mainPage);
                },
              );
            }

            // Build content
            return BuildSignInPage(
              provider: provider,
              authStore: signInStore!,
            );
          },
        ),
      ),
    );
  }
}

class BuildSignInPage extends StatelessWidget {
  const BuildSignInPage({
    Key? key,
    required this.provider,
    required this.authStore,
  }) : super(key: key);

  final AuthPageProvider provider;
  final SignInStore authStore;

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
              SizedBox(height: AppDimens.largeHeightDimens * 2),
              Center(
                child: SvgPicture.asset(
                  "assets/images/app_logo.svg",
                  color: AppColors.primaryColor,
                ),
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
                  onTap: () =>
                      GoRouter.of(context).push(GetIt.I<AppRoutes>().getCode),
                  child: Text(
                    "${LocaleKeys.forgotPassword.tr()} ?",
                    style: AppStyles.subtitle2TextStyle.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppDimens.extraLargeWidthDimens * 2),
              DefaultTextButton(
                submit: () async {
                  // Check form is valid
                  if (provider.signInKey.currentState!.validate()) {
                    final email = provider.emailController.text.trim();
                    final password = provider.passwordController.text.trim();

                    print("submitAccount: $email / $password");

                    authStore.signIn(email, password);
                  }
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
              Center(
                child: LinkText(
                  contentText1: LocaleKeys.dontHaveAccount.tr(),
                  contentText2: "  ${LocaleKeys.signUp.tr()}",
                  onTap1: () {},
                  onTap2: () =>
                      GoRouter.of(context).push(GetIt.I<AppRoutes>().signUp),
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
