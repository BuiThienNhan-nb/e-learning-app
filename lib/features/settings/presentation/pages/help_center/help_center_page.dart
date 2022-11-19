import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../../../configs/colors.dart';
import '../../../../../configs/dimens.dart';
import '../../../../../utils/mock/mock_faq.dart';
import '../../widgets/setting_app_bar.dart';
import 'contact_us_page.dart';
import 'faq_page.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: SettingAppBar(
          title: "Help Center",
          bottom: TabBar(
            tabs: const [
              Tab(
                text: "FAQ",
              ),
              Tab(
                text: "Contact us",
              ),
            ],
            labelColor: AppColors.primaryColor,
            indicator: MaterialIndicator(
              tabPosition: TabPosition.bottom,
              color: AppColors.primaryColor,
              strokeWidth: 1,
              horizontalPadding: AppDimens.extraLargeWidthDimens,
              // distanceFromCenter: 16,
              // radius: 3,
              paintingStyle: PaintingStyle.fill,
            ),
          ),
        ),
        body: Container(
          color: AppColors.whiteColor,
          padding: EdgeInsets.all(AppDimens.mediumWidthDimens),
          child: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: [
              FAQPage(
                faqs: GetIt.I<MockFAQ>().faqs,
              ),
              const ContactUsPage(),
            ],
          ),
        ),
      ),
    );
  }
}
