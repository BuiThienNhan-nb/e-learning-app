import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/configs/dimens.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/faq_model.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({
    super.key,
    required this.faqs,
  });

  final List<FAQModel> faqs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: faqs.length,
      itemBuilder: (context, index) => FAQItem(faq: faqs[index]),
    );
  }
}

class FAQItem extends StatelessWidget {
  const FAQItem({
    super.key,
    required this.faq,
  });

  final FAQModel faq;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        AppDimens.mediumWidthDimens,
        AppDimens.smallHeightDimens,
        AppDimens.mediumWidthDimens,
        AppDimens.smallHeightDimens,
      ),
      margin: EdgeInsets.all(AppDimens.mediumWidthDimens),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppDimens.itemRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral.shade400.withOpacity(0.4),
            blurRadius: AppDimens.mediumHeightDimens,
            // offset: const Offset(1, 1),
            blurStyle: BlurStyle.normal,
            spreadRadius: 0.4,
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          trailing: Image.asset(
            "assets/icons/sort_down_icon.png",
            color: AppColors.secondaryColor,
          ),
          childrenPadding: EdgeInsets.only(left: AppDimens.largeWidthDimens),
          title: Text(
            faq.question,
            style: AppStyles.headline6TextStyle.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          children: [
            Text(faq.description, style: AppStyles.subtitle1TextStyle),
          ],
        ),
      ),
    );
  }
}
