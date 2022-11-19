import 'package:e_learning_app/configs/colors.dart';
import 'package:flutter/material.dart';

import '../payment_page.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PaymentItem> items = [
      PaymentItem(
        cardImageSource: "assets/icons/headphone_icon.png",
        title: "Customer Services",
        status: "",
        iconColor: AppColors.primaryColor,
      ),
      PaymentItem(
        cardImageSource: "assets/icons/website_icon.png",
        title: "Website",
        status: "",
        iconColor: AppColors.primaryColor,
      ),
      PaymentItem(
        cardImageSource: "assets/icons/mail_fill_icon.png",
        title: "Mail",
        status: "",
        iconColor: AppColors.primaryColor,
      ),
      PaymentItem(
        cardImageSource: "assets/icons/facebook_icon.png",
        title: "Facebook",
        status: "",
        iconColor: AppColors.primaryColor,
      ),
      PaymentItem(
        cardImageSource: "assets/icons/instagram_icon.png",
        title: "Instagram",
        status: "",
        iconColor: AppColors.primaryColor,
      ),
    ];

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    );
  }
}
