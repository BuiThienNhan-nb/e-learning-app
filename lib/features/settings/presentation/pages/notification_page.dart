import 'dart:math';

import 'package:e_learning_app/configs/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../configs/dimens.dart';
import '../widgets/setting_app_bar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "General Notification",
      "Sound",
      "Vibrate",
      "Special Offer",
      "Promo & Discount",
      "Payments",
      "App Updates",
    ];
    return Scaffold(
      appBar: const SettingAppBar(title: "Notification"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: titles
              .map(
                (e) => NotificationItem(
                  title: e,
                  isOn: Random().nextBool(),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class NotificationItem extends StatefulWidget {
  NotificationItem({
    super.key,
    required this.title,
    required this.isOn,
  });

  final String title;
  bool isOn;

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimens.largeWidthDimens),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontWeight: FontWeight.normal),
          ),
          CupertinoSwitch(
            value: widget.isOn,
            activeColor: AppColors.primaryColor,
            onChanged: (value) => setState(
              () => widget.isOn = value,
            ),
          ),
        ],
      ),
    );
  }
}
