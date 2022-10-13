import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../bases/presentation/atoms/link_text.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/styles.dart';
import '../../../../core/app/provider.dart';
import '../../../../utils/extensions/device_extension.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppBar({
    Key? key,
    // required this.appProvider,
    this.imageHeight,
    this.imageWidth,
    this.appBarHeight,
  }) : super(key: key);

  // final AppProvider appProvider;
  double? appBarHeight;
  double? imageHeight;
  double? imageWidth;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (_, provider, __) => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: false,
        titleSpacing: 0,
        foregroundColor: AppColors.blackColor,
        flexibleSpace: SafeArea(
          child: SizedBox(
            height: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: AppDimens.largeHeightDimens),
                CachedNetworkImage(
                  imageUrl:
                      "https://i.kinja-img.com/gawker-media/image/upload/q_75,w_1200,h_900,c_fill/8df231ec8f1266779a6908117e0650ac.JPG",
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                  imageBuilder: (context, imageProvider) => Container(
                    height: imageHeight ?? AppDimens.extraLargeHeightDimens * 2,
                    width: imageWidth ?? AppDimens.extraLargeWidthDimens * 2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: AppDimens.mediumWidthDimens),
                LinkText(
                  contentText1: DateTime.now().toGreetingString().tr(),
                  contentText2: "\n${provider.user.name}",
                  onTap1: () {},
                  onTap2: () {},
                  text1Style: AppStyles.subtitle1TextStyle.copyWith(
                    fontSize: 14.sp,
                  ),
                  text2Style: AppStyles.subtitle1TextStyle.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                  topPadding: 0,
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.all(AppDimens.mediumHeightDimens * 1.6),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.neutral.shade300),
                    shape: BoxShape.circle,
                  ),
                  child: Badge(
                    shape: BadgeShape.circle,
                    position: BadgePosition.topEnd(end: -1.w, top: -4.h),
                    showBadge: provider.hasNotification,
                    child: Image.asset(
                      "assets/icons/notification_icon.png",
                      height: imageHeight ?? AppDimens.extraLargeHeightDimens,
                      width: imageWidth ?? AppDimens.extraLargeWidthDimens,
                    ),
                  ),
                ),
                SizedBox(width: AppDimens.largeHeightDimens),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(appBarHeight ?? AppDimens.extraLargeHeightDimens * 3);
}
