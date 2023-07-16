import 'package:e_learning_app/configs/formats.dart';
import 'package:e_learning_app/features/auth/forgot_password/presentation/pages/forgot_password_page.dart';
import 'package:e_learning_app/features/auth/forgot_password/presentation/state/mobx/forgot_password_store.dart';
import 'package:e_learning_app/features/auth/forgot_password/presentation/state/providers/forgot_password_provider.dart';
import 'package:e_learning_app/features/settings/presentation/states/mobx/edit_profile_store.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../bases/presentation/atoms/date_picker.dart';
import '../../../../bases/presentation/atoms/default_result_dialog.dart';
import '../../../../bases/presentation/atoms/dropdown_button.dart';
import '../../../../bases/presentation/atoms/password_text_form_field.dart';
import '../../../../bases/presentation/atoms/text_button.dart';
import '../../../../bases/presentation/atoms/text_form_field.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/validations.dart';
import '../../../../core/app/loading.dart';
import '../../../../core/app/provider.dart';
import '../../../../core/app/values.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../../../../utils/extensions/list_extension.dart';
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
    final provider = context.read<SettingsPageProvider>();
    final store = context.read<EditProfileStore>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Observer(
        builder: (_) {
          // Trigger UI
          if (store.updateState == BaseSate.loading) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AppLoading.showLoadingDialog(context);
            });
          }
          if (store.updateState == BaseSate.error ||
              store.errorMessage != null) {
            print(store.errorMessage ?? "Error");
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
          } else if (store.updateState == BaseSate.loaded) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) {
                GetIt.I<AppProvider>().user = store.user!;
                AppLoading.dismissLoadingDialog(context);
                GoRouter.of(context).pop();
              },
            );
          }
          return Scaffold(
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
                        text: GetIt.I<AppProvider>().user.email,
                      ),
                      readOnly: true,
                    ),
                    SizedBox(height: AppDimens.largeHeightDimens),
                    PasswordTextFormField(
                      readOnly: true,
                      controller: TextEditingController(text: "Nhan2509@"),
                      onSuffixIconTap: () async {
                        final store = GetIt.I<ForgotPasswordStore>();
                        AppLoading.showLoadingDialog(context);
                        await store.getCode(
                          GetIt.I<AppProvider>().user.email,
                        );
                        if (context.mounted) {
                          AppLoading.dismissLoadingDialog(context);
                          if (store.getCodeState == BaseSate.error ||
                              store.errorMessage != null) {
                            showDialog(
                              context: context,
                              builder: (_) => DefaultResultDialog(
                                content: store.errorMessage ??
                                    LocaleKeys.serverUnexpectedError.tr(),
                                isError: true,
                              ),
                            );
                          } else if (store.getCodeState == BaseSate.loaded) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => MultiProvider(
                                providers: [
                                  ChangeNotifierProvider<
                                      ForgotPasswordPageProvider>(
                                    create: (context) => GetIt.I(),
                                    lazy: true,
                                  ),
                                  Provider<ForgotPasswordStore>(
                                    create: (_) => GetIt.I(),
                                    lazy: true,
                                  ),
                                ],
                                child: const ForgotPasswordPage(),
                              ),
                            ));
                          }
                        }
                      },
                      suffixIconSource: "assets/icons/key_icon.png",
                    ),
                    SizedBox(height: AppDimens.largeHeightDimens),
                    DefaultDropdownButton(
                      labelText: LocaleKeys.gender.tr(),
                      prefixIcon: "assets/icons/gender_icon.png",
                      items: AppValues.instance.appSupportedGender
                          .toCurrentLocale(),
                      selectedIndex: provider.genderIndex,
                      onChanged: (index) => provider.genderIndex = index,
                    ),
                    SizedBox(height: AppDimens.largeHeightDimens),
                    DefaultDropdownButton(
                      labelText: LocaleKeys.title.tr(),
                      prefixIcon: "assets/icons/briefcase_icon.png",
                      items: AppValues.instance.title.toCurrentLocale(),
                      selectedIndex:
                          GetIt.I<AppProvider>().user.role == "teacher" ? 0 : 1,
                      onChanged: (index) {},
                      disable: true,
                    ),
                    SizedBox(height: AppDimens.extraLargeHeightDimens),
                    DefaultTextButton(
                      submit: () {
                        GetIt.I<AppProvider>().user.name =
                            provider.nameController.text.trim();
                        GetIt.I<AppProvider>().user.birthday = AppFormats
                            .instance.formatDay
                            .parse(provider.datePickerController.text.trim());
                        GetIt.I<AppProvider>().user.gender = AppValues
                            .instance.appSupportedGender[provider.genderIndex];
                        print("updated user: ${GetIt.I<AppProvider>().user}");
                        store.updateProfile(GetIt.I<AppProvider>().user);
                      },
                      title: "Update",
                    ),
                    // Container(
                    //   padding: EdgeInsets.all(AppDimens.mediumHeightDimens),
                    //   decoration: BoxDecoration(
                    //     borderRadius:
                    //         BorderRadius.circular(AppDimens.extraItemRadius),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: AppColors.secondaryColor.withOpacity(0.3),
                    //         blurRadius: AppDimens.mediumHeightDimens,
                    //         offset: const Offset(1, 4),
                    //         blurStyle: BlurStyle.normal,
                    //         spreadRadius: 0.5,
                    //       ),
                    //     ],
                    //   ),
                    //   child: DefaultTextButton(
                    //     submit: () {},
                    //     title: "Update",
                    //   ),
                    // ),
                    SizedBox(height: AppDimens.mediumHeightDimens),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
