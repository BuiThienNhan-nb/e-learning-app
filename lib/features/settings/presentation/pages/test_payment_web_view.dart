import 'dart:convert';
import 'dart:typed_data';

import 'package:e_learning_app/configs/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../widgets/setting_app_bar.dart';

class TestPaymentWebView extends StatelessWidget {
  const TestPaymentWebView({super.key});

  @override
  Widget build(BuildContext context) {
    const String url =
        "https://sandbox.vnpayment.vn/paymentv2/Transaction/PaymentMethod.html?token=2843d9d8031349699f68a71de6f946ae";

    final settings = InAppBrowserClassOptions(
      crossPlatform: InAppBrowserOptions(hideUrlBar: false),
      inAppWebViewGroupOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(javaScriptEnabled: true),
      ),
    );

    return SafeArea(
      child: Scaffold(
        appBar: const SettingAppBar(title: "Payment"),
        body: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse("${Env.instance.baseUrl}/create_payment_url"),
            method: "POST",
            body: Uint8List.fromList(utf8.encode(
                "amount=1000&orderDescription=77da51a6-fae1-48ef-aee0-260100849e70&language=vn")),
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          ),
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              mediaPlaybackRequiresUserGesture: false,
            ),
          ),
        ),
      ),
    );
  }
}
