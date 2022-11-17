import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../bases/presentation/atoms/default_app_bar.dart';
import '../../../../bases/presentation/atoms/network_image.dart';
import '../../../../configs/dimens.dart';
import '../../../../core/app/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    int index = 0;
    final List<String> title = [
      "Edit Profile",
      "Notifications",
      "Payment",
      "Security",
      "Language",
      "Privacy Policy",
      "Help Center",
    ];
    final List<String> iconDataSource = [
      "assets/icons/user_icon.png",
      "assets/icons/notification_icon.png",
      "assets/icons/credit_card_icon.png",
      "assets/icons/security_icon.png",
      "assets/icons/three_dots_icon.png",
      "assets/icons/lock_icon.png",
      "assets/icons/help_center_icon.png",
    ];
    return SafeArea(
      child: Scaffold(
        appBar: const DefaultAppBar(title: "Profile"),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Consumer<AppProvider>(
            builder: (context, provider, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: AppDimens.largeHeightDimens),
                Container(
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
                  child: DefaultNetworkImage(
                    imageUrl:
                        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                    blurHash: "LPGcJskWK+wb_Noer=NG.TRjRQt7",
                    height: AppDimens.extraLargeHeightDimens * 4,
                    width: AppDimens.extraLargeWidthDimens * 4,
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
                  children: List<Widget>.from(
                    title
                        .map(
                          (e) => SettingsItem(
                            iconSource: iconDataSource[index++],
                            title: e,
                            onTap: () {},
                          ),
                        )
                        .toList()
                      ..add(
                        SettingsItem(
                          iconSource: "assets/icons/logout_icon.png",
                          title: "Log out",
                          onTap: () {},
                          isLogOut: true,
                        ),
                      ),
                  ),
                ),
              ],
            ),
          ),
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
                      : AppColors.blackColor,
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
