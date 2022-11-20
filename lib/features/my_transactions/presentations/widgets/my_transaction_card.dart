import 'package:flutter/material.dart';

import '../../../../bases/presentation/atoms/network_image.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../../../../configs/styles.dart';

class MyTransactionCard extends StatelessWidget {
  const MyTransactionCard({
    super.key,
    // required this.transaction,
  });

  // final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimens.extraLargeHeightDimens * 6,
      width: double.infinity,
      margin: EdgeInsets.all(AppDimens.mediumWidthDimens),
      padding: EdgeInsets.only(
        left: AppDimens.mediumWidthDimens,
        top: AppDimens.smallHeightDimens,
        bottom: AppDimens.smallHeightDimens,
        right: 0,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.neutral.shade300),
        borderRadius: BorderRadius.circular(AppDimens.largeRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral.shade200,
            blurRadius: AppDimens.mediumHeightDimens,
            // offset: const Offset(1, 1),
            blurStyle: BlurStyle.normal,
            spreadRadius: 0.2,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: AppDimens.smallWidthDimens),
          DefaultNetworkImage(
            imageUrl:
                "https://images.unsplash.com/photo-1586880244406-556ebe35f282?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
            blurHash: "LGJa=s009F%N~ox]00%M?E4otRM{",
            height: (AppDimens.extraLargeHeightDimens * 4.6),
            width: AppDimens.mediumWidthDimens * 14,
            shape: BoxShape.rectangle,
            borderRadius: AppDimens.mediumRadius,
          ),
          SizedBox(width: AppDimens.mediumWidthDimens),
          SizedBox(
            width: AppDimens.extraLargeWidthDimens * 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Passive Income 6 figures Drop Servicing Home Online Business",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.subtitle1TextStyle.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: AppDimens.mediumHeightDimens),
                Container(
                  padding: EdgeInsets.all(AppDimens.mediumHeightDimens),
                  decoration: BoxDecoration(
                    color: AppColors.subThemeColor,
                    borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
                  ),
                  child: Text(
                    "Business",
                    style: AppStyles.subtitle2TextStyle.copyWith(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(AppDimens.mediumWidthDimens),
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(AppDimens.largeRadius),
            ),
            child: Text(
              "E-Receipt",
              style: AppStyles.subtitle2TextStyle.copyWith(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // CircularPercentIndicator(
          //   radius: AppDimens.extraLargeWidthDimens * 1.2,
          //   percent: progress,
          //   lineWidth: 8,
          //   animation: true,
          //   animationDuration: 1200,
          //   circularStrokeCap: CircularStrokeCap.round,
          //   progressColor: progress >= 0.6
          //       ? AppColors.pigmentGreenColor
          //       : progress >= 0.4
          //           ? Colors.yellow
          //           : AppColors.fireEngineRedColor,
          //   center: Text(
          //     "${(progress * 100).toStringAsFixed(1)}%",
          //     style: AppStyles.subtitle2TextStyle.copyWith(
          //       color: AppColors.primaryColor,
          //       fontWeight: FontWeight.w900,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
