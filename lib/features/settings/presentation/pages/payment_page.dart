import 'package:e_learning_app/configs/styles.dart';
import 'package:flutter/material.dart';

import '../../../../bases/presentation/atoms/text_button.dart';
import '../../../../configs/colors.dart';
import '../../../../configs/dimens.dart';
import '../widgets/setting_app_bar.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingAppBar(title: "Payment"),
      body: SizedBox(
        height: AppDimens.appDesignSize.height - 56,
        child: Stack(
          fit: StackFit.loose,
          alignment: Alignment.topCenter,
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PaymentItem(
                    cardImageSource: "assets/icons/paypal_icon.png",
                    title: "Paypal",
                  ),
                  PaymentItem(
                    cardImageSource: "assets/icons/apple_pay_icon.png",
                    title: "Apple pay",
                    status: "Disconnected",
                  ),
                  PaymentItem(
                    cardImageSource: "assets/icons/paypal_icon.png",
                    title: "Paypal",
                  ),
                  PaymentItem(
                    cardImageSource: "assets/icons/paypal_icon.png",
                    title: "Paypal",
                  ),
                  PaymentItem(
                    cardImageSource: "assets/icons/paypal_icon.png",
                    title: "Paypal",
                  ),
                  PaymentItem(
                    cardImageSource: "assets/icons/paypal_icon.png",
                    title: "Paypal",
                  ),
                  PaymentItem(
                    cardImageSource: "assets/icons/paypal_icon.png",
                    title: "Paypal",
                  ),
                  PaymentItem(
                    cardImageSource: "assets/icons/paypal_icon.png",
                    title: "Paypal",
                  ),
                  PaymentItem(
                    cardImageSource: "assets/icons/paypal_icon.png",
                    title: "Paypal",
                  ),
                  PaymentItem(
                    cardImageSource: "assets/icons/paypal_icon.png",
                    title: "Paypal",
                  ),
                  PaymentItem(
                    cardImageSource: "assets/icons/paypal_icon.png",
                    title: "Paypal",
                  ),
                  PaymentItem(
                    cardImageSource: "assets/icons/paypal_icon.png",
                    title: "Paypal",
                  ),
                  PaymentItem(
                    cardImageSource: "assets/icons/paypal_icon.png",
                    title: "Paypal",
                  ),
                  PaymentItem(
                    cardImageSource: "assets/icons/paypal_icon.png",
                    title: "Paypal",
                  ),
                  PaymentItem(
                    cardImageSource: "assets/icons/paypal_icon.png",
                    title: "Paypal",
                  ),
                  PaymentItem(
                    cardImageSource: "assets/icons/paypal_icon.png",
                    title: "Paypal",
                  ),
                  PaymentItem(
                    cardImageSource: "assets/icons/paypal_icon.png",
                    title: "Paypal",
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: AppDimens.largeHeightDimens,
              child: DefaultTextButton(
                submit: () {},
                title: "Add new card",
                width: AppDimens.appDesignSize.width -
                    AppDimens.extraLargeWidthDimens,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentItem extends StatelessWidget {
  PaymentItem({
    super.key,
    required this.cardImageSource,
    required this.title,
    this.status = "Connected",
    this.iconColor,
  });

  final String cardImageSource;
  final String title;
  String status = "Connected";
  Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppDimens.largeWidthDimens,
        AppDimens.largeHeightDimens,
        AppDimens.largeWidthDimens,
        0,
      ),
      child: Container(
        padding: EdgeInsets.all(AppDimens.largeWidthDimens),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(AppDimens.itemRadius),
          boxShadow: [
            BoxShadow(
              color: AppColors.secondaryColor.withOpacity(0.15),
              blurRadius: AppDimens.mediumHeightDimens,
              // offset: const Offset(1, 1),
              blurStyle: BlurStyle.normal,
              spreadRadius: 0.4,
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              cardImageSource,
              color: iconColor,
            ),
            SizedBox(width: AppDimens.largeWidthDimens),
            Expanded(
              child: Text(title),
            ),
            SizedBox(width: AppDimens.mediumWidthDimens),
            Text(
              status,
              style: AppStyles.subtitle1TextStyle.copyWith(
                color: status.compareTo("Connected") == 0
                    ? AppColors.primaryColor
                    : AppColors.fireEngineRedColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
