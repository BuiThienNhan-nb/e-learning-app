import 'dart:developer';

import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../../bases/mobx/base_state.dart';
import '../../../../bases/presentation/atoms/default_app_bar.dart';
import '../../../../bases/presentation/atoms/default_result_dialog.dart';
import '../../../../bases/presentation/atoms/network_image.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/routes.dart';
import '../../../../core/app/loading.dart';
import '../../../../core/app/provider.dart';
import '../../../../core/app/values.dart';
import '../../../../generated/translations/locale_keys.g.dart';
import '../states/mobx/update_avatar_store.dart';
import '../widgets/update_avatar_bottom_sheet.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I<UpdateAvatarStore>();
    List<Widget> buildListSettingsItems() => [
          SettingsItem(
            iconSource: "assets/icons/user_icon.png",
            title: "Edit Profile",
            onTap: () => GoRouter.of(context).pushNamed(
              "edit_profile",
              params: {
                "userId": "user_id_pass_to_edit_profile",
              },
            ),
          ),
          GetIt.I<AppProvider>().user.role == AppValues.instance.title.first
              ? SettingsItem(
                  iconSource: "assets/icons/my_course_inactive_icon.png",
                  title: "My Uploaded Course",
                  onTap: () => GoRouter.of(context).pushNamed("my_courses"),
                )
              : const SizedBox.shrink(),
          SettingsItem(
            iconSource: "assets/icons/notification_icon.png",
            title: "Notifications",
            onTap: () => GoRouter.of(context).pushNamed("notification"),
          ),
          SettingsItem(
            iconSource: "assets/icons/credit_card_icon.png",
            title: "Payment",
            onTap: () => GoRouter.of(context).pushNamed("payment"),
          ),
          SettingsItem(
            iconSource: "assets/icons/security_icon.png",
            title: "Security",
            onTap: () {},
          ),
          SettingsItem(
            iconSource: "assets/icons/three_dots_icon.png",
            title: "Language",
            onTap: () => GoRouter.of(context).pushNamed("language"),
          ),
          SettingsItem(
            iconSource: "assets/icons/lock_icon.png",
            title: "Privacy Policy",
            onTap: () => GoRouter.of(context).pushNamed("privacy_policy"),
          ),
          SettingsItem(
            iconSource: "assets/icons/help_center_icon.png",
            title: "Help Center",
            onTap: () => GoRouter.of(context).pushNamed("help_center"),
          ),
          SettingsItem(
            iconSource: "assets/icons/logout_icon.png",
            title: "Log out",
            onTap: () => GoRouter.of(context).go(GetIt.I<AppRoutes>().signIn),
            isLogOut: true,
          ),
        ];

    return SafeArea(
      child: Scaffold(
        appBar: const DefaultAppBar(title: "Profile"),
        body: Observer(
          builder: (context) {
            if (store.updateState == BaseSate.loading) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AppLoading.showLoadingDialog(context);
              });
            }
            if (store.updateState == BaseSate.error ||
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
            } else if (store.updateState == BaseSate.loaded) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  AppLoading.dismissLoadingDialog(context);
                  // Navigator.of(context, rootNavigator: true).pop();
                  store.getAvatarDownloadUrl();
                },
              );
            }

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Consumer<AppProvider>(
                builder: (context, provider, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: AppDimens.largeHeightDimens),
                    GestureDetector(
                      onTap: () => showMaterialModalBottomSheet(
                        context: context,
                        enableDrag: true,
                        useRootNavigator: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppDimens.itemRadius),
                            topRight: Radius.circular(AppDimens.itemRadius),
                          ),
                        ),
                        builder: (context) => UpdateAvatarBottomSheet(
                          store: store,
                        ),
                      ),
                      child: Container(
                        height: AppDimens.extraLargeHeightDimens * 4,
                        width: AppDimens.extraLargeWidthDimens * 4,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.neutral.shade200),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.neutral.shade400,
                              blurRadius: AppDimens.mediumHeightDimens,
                              // offset: const Offset(1, 1),
                              blurStyle: BlurStyle.normal,
                              spreadRadius: 0.2,
                            ),
                          ],
                        ),
                        child: FutureBuilder<String>(
                          future: store.getAvatarDownloadUrl(),
                          builder: (_, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasError) {}

                              return DefaultNetworkImage(
                                imageUrl: snapshot.data ?? "",
                                blurHash: "LKHBPW~BuPg\$.SI[%MxaKjM{\$*f8",
                                height: AppDimens.extraLargeHeightDimens * 4,
                                width: AppDimens.extraLargeWidthDimens * 4,
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                    ),
                    Text(
                      provider.user.name,
                      style: AppStyles.headline6TextStyle.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      provider.user.email,
                      style: AppStyles.subtitle1TextStyle,
                    ),
                    const Divider(
                      thickness: 1.2,
                    ),
                    Column(
                      children: buildListSettingsItems(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  SettingsItem({
    super.key,
    required this.iconSource,
    required this.title,
    required this.onTap,
    this.isLogOut = false,
  });

  final Function()? onTap;
  final String iconSource;
  final String title;
  bool? isLogOut = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(AppDimens.largeWidthDimens),
        padding: EdgeInsets.all(AppDimens.mediumWidthDimens),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              iconSource,
              color: isLogOut != null && isLogOut!
                  ? AppColors.fireEngineRedColor
                  : AppColors.blackColor,
            ),
            SizedBox(width: AppDimens.largeWidthDimens),
            Expanded(
              child: Text(
                title,
                style: AppStyles.subtitle1TextStyle.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isLogOut != null && isLogOut!
                      ? AppColors.fireEngineRedColor
                      : AppColors.neutral.shade800,
                ),
              ),
            ),
            isLogOut != null && isLogOut!
                ? const SizedBox.shrink()
                : const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.blackColor,
                  ),
          ],
        ),
      ),
    );
  }
}
