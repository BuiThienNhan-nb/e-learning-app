import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/configs/dimens.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:flutter/material.dart';

import '../../../../configs/formats.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.itemRadius),
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
      child: CouponCard(
        curveAxis: Axis.vertical,
        borderRadius: AppDimens.itemRadius,
        backgroundColor: AppColors.whiteColor,
        curvePosition: AppDimens.itemRadius * 6,
        firstChild: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Image.asset(
                "assets/icons/discount_rabbit_icon.png",
                fit: BoxFit.scaleDown,
              ),
            ),
            SizedBox(
              width: AppDimens.smallWidthDimens / 2,
              child: Column(
                children: List.generate(
                  16,
                  (index) => Expanded(
                    child: Container(
                      width: AppDimens.smallWidthDimens / 2,
                      color: index % 2 == 0
                          ? AppColors.neutral.shade500
                          : Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        secondChild: Padding(
          padding: EdgeInsets.only(
            left: AppDimens.mediumWidthDimens,
            right: AppDimens.mediumHeightDimens,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppDimens.mediumHeightDimens),
              Text(
                "TODAY SPECIAL - 35% OFF",
                style: AppStyles.headline6TextStyle.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryColor,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: AppDimens.smallHeightDimens),
              Text(
                "Expiry date: ${AppFormats.instance.formatDay.format(DateTime.now().add(const Duration(days: 1)))}",
                style: AppStyles.subtitle2TextStyle.copyWith(
                  color: AppColors.neutral.shade600,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "USE NOW",
                      style: AppStyles.subtitle1TextStyle.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
