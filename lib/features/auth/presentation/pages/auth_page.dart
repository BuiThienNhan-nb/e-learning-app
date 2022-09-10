import 'dart:developer';

import 'package:e_learning_app/bases/presentation/atoms/rich_text.dart';
import 'package:e_learning_app/bases/presentation/atoms/text_button.dart';
import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/configs/languages.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:e_learning_app/core/app/values.dart';
import 'package:e_learning_app/features/auth/presentation/widgets/fb_gg_auth.dart';
import 'package:e_learning_app/features/auth/presentation/widgets/lang_switcher.dart';
import 'package:e_learning_app/features/auth/presentation/widgets/login_form.dart';
import 'package:e_learning_app/utils/extensions/context_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../../../configs/dimens.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../state/provider/auth_page_provider.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AuthPageProvider>();

    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
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
                      onTap: () => log("message"),
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
                  MyDefaultTextButton(
                    submit: () {
                      log(
                        provider.emailController.text.trim() +
                            provider.passwordController.text.trim(),
                      );
                      showDialog(
                        context: AppValues.navigatorKey.currentContext!,
                        builder: (context) => Material(
                          color: Colors.transparent,
                          child: Center(
                            child: LoadingAnimationWidget.hexagonDots(
                              color: AppColors.primaryColor,
                              size: AppDimens.extraLargeHeightDimens * 2,
                            ),
                          ),
                        ),
                      );
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
                    child: MyRichText(
                      contentText1: LocaleKeys.dontHaveAccount.tr(),
                      contentText2: "  ${LocaleKeys.signUp.tr()}",
                      onTap1: () {},
                      onTap2: () => log("message"),
                    ),
                  ),
                  SizedBox(height: AppDimens.mediumHeightDimens),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
