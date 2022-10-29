import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/styles.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimens.largeHeightDimens),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(AppDimens.extraItemRadius),
        // gradient: const LinearGradient(
        //   colors: [
        //     AppColors.cornflowerBlueColor,
        //     AppColors.primaryColor,
        //   ],
        //   stops: [
        //     0,
        //     0.8,
        //   ],
        //   begin: Alignment.topLeft,
        // ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: AppDimens.appDesignSize.width -
                (AppDimens.extraLargeWidthDimens * 2),
            child: RichText(
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                style: AppStyles.headline6TextStyle.copyWith(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "20% OFF\n",
                    style: AppStyles.headline6TextStyle.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 16.sp,
                    ),
                  ),
                  const TextSpan(
                    text: "TODAY SPECIAL\n\n",
                  ),
                  const TextSpan(
                    text:
                        "Get a discount for every course order! Only valid today!a a a a a aaaaaaaaaaaaaaaaaaaaaa",
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: -AppDimens.mediumHeightDimens,
            child: Text(
              "40%",
              style: AppStyles.headline3TextStyle.copyWith(
                color: AppColors.whiteColor,
                shadows: [
                  Shadow(
                    color: AppColors.neutral.shade200.withOpacity(0.8),
                    blurRadius: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
