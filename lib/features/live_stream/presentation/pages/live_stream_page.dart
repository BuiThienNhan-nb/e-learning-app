import 'package:e_learning_app/bases/presentation/atoms/default_app_bar.dart';
import 'package:e_learning_app/bases/presentation/atoms/text_button.dart';
import 'package:e_learning_app/bases/presentation/atoms/text_form_field.dart';
import 'package:e_learning_app/configs/dimens.dart';
import 'package:e_learning_app/configs/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';

import '../../../../configs/colors.dart';
import '../../../settings/presentation/pages/settings_page.dart';

class LiveStreamPage extends StatelessWidget {
  const LiveStreamPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const DefaultAppBar(title: "Live Stream"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: EdgeInsets.all(AppDimens.extraLargeWidthDimens),
            padding: EdgeInsets.all(AppDimens.extraLargeWidthDimens),
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
            child: Column(
              children: [
                Text(
                  "Join Live stream",
                  style: AppStyles.headline5TextStyle.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: AppDimens.largeHeightDimens),
                DefaultTextFormField(
                  labelText: "",
                  controller: controller,
                  hintText: "Room id...",
                ),
                SizedBox(height: AppDimens.mediumHeightDimens),
                DefaultTextButton(
                  submit: () => GoRouter.of(context).pushNamed(
                    "live_stream",
                    extra: "/${controller.text.trim()}",
                  ),
                  // submit: () => pushLiveStreamBrowser(controller.text.trim()),
                  title: "Join live stream",
                  width: AppDimens.appDesignSize.width -
                      AppDimens.extraLargeWidthDimens * 6,
                  backgroundColor: AppColors.primaryColor.withOpacity(0.2),
                  titleStyle: AppStyles.headline6TextStyle.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          DefaultTextButton(
            submit: () => GoRouter.of(context).pushNamed(
              "live_stream",
              extra: "",
            ),
            // submit: () => pushLiveStreamBrowser(""),
            title: "Start Live stream",
            width: AppDimens.appDesignSize.width -
                AppDimens.extraLargeWidthDimens * 4,
          ),
        ],
      ),
    );
  }

  void pushLiveStreamBrowser(String roomId) {
    final MyInAppBrowser browser = MyInAppBrowser();
    final url = "https://d9f5-171-227-199-184.ngrok.io/$roomId";

    final settings = InAppBrowserClassOptions(
      crossPlatform: InAppBrowserOptions(hideUrlBar: false),
      inAppWebViewGroupOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
          javaScriptEnabled: true,
          mediaPlaybackRequiresUserGesture: false,
        ),
      ),
    );

    browser.openUrlRequest(
      urlRequest: URLRequest(
        url: Uri.parse(url),
      ),
      options: settings,
    );
  }
}
