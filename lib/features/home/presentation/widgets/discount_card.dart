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
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(AppDimens.extraItemRadius),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: AppDimens.largeWidthDimens,
            child: SizedBox(
              width: AppDimens.appDesignSize.width -
                  (AppDimens.extraLargeWidthDimens * 2),
              child: RichText(
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
                          "Get a discount for every course order! Only valid today!",
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: AppDimens.extraLargeHeightDimens,
            top: AppDimens.largeHeightDimens,
            child: Text(
              "40%",
              style: AppStyles.headline3TextStyle.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
