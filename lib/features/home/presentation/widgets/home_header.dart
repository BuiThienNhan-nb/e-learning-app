import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../bases/presentation/atoms/link_text.dart';
import '../../../../bases/presentation/atoms/network_image.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/styles.dart';
import '../../../../core/app/provider.dart';
import '../../../../utils/extensions/device_extension.dart';

class HomeHeader extends SliverPersistentHeaderDelegate {
  final double _minSub1 = 16.sp;
  final double _maxSub1 = 28.sp;
  final double _minSub2 = 14.sp;
  final double _maxSub2 = 24.sp;
  final double textMovement = 8.w;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / maxExtent;
    final sub1FontSize = (_maxSub1 * (1 - percent)).clamp(_minSub1, _maxSub1);
    final sub2FontSize = (_maxSub2 * (1 - percent)).clamp(_minSub2, _maxSub2);

    return Consumer<AppProvider>(
      builder: (_, provider, __) => Container(
        color: AppColors.whiteColor,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned(
              left: AppDimens.mediumWidthDimens,
              top: AppDimens.extraLargeHeightDimens * 0.5,
              child: Container(
                // height: AppDimens.extraLargeHeightDimens * 2.4,
                // width: AppDimens.extraLargeWidthDimens * 2.4,
                padding: EdgeInsets.all(AppDimens.extraLargeWidthDimens * 0.1),
                decoration: const BoxDecoration(
                  color: AppColors.secondaryColor,
                  shape: BoxShape.circle,
                ),
                child: DefaultNetworkImage(
                  imageUrl:
                      "https://i.kinja-img.com/gawker-media/image/upload/q_75,w_1200,h_900,c_fill/8df231ec8f1266779a6908117e0650ac.JPG",
                  blurHash: "LUE{|Z~qNeIV0LE2WAozIpR+t6oI",
                  height: AppDimens.extraLargeHeightDimens * 2,
                  width: AppDimens.extraLargeWidthDimens * 2,
                ),
              ),
            ),
            Positioned(
              left: AppDimens.mediumWidthDimens * 2 +
                  AppDimens.extraLargeWidthDimens * 2 * percent * 1.05,
              bottom: percent + AppDimens.extraLargeHeightDimens * 0.5,
              child: LinkText(
                contentText1: DateTime.now().toGreetingString().tr(),
                contentText2: "\n${provider.user.name}",
                onTap1: () {},
                onTap2: () {},
                text1Style: AppStyles.subtitle2TextStyle.copyWith(
                  fontSize: sub2FontSize,
                ),
                text2Style: AppStyles.subtitle1TextStyle.copyWith(
                  fontSize: sub1FontSize,
                  fontWeight: FontWeight.w900,
                ),
                topPadding: 0,
                textAlign: TextAlign.start,
              ),
            ),
            Positioned(
              right: AppDimens.mediumWidthDimens,
              top: AppDimens.extraLargeHeightDimens * 0.5,
              child: Container(
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
                    height: AppDimens.extraLargeHeightDimens,
                    width: AppDimens.extraLargeWidthDimens,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => AppDimens.extraLargeHeightDimens * 7;

  @override
  double get minExtent => AppDimens.extraLargeHeightDimens * 3;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
