import 'package:e_learning_app/configs/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageSwitcher extends StatefulWidget {
  const LanguageSwitcher({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final void Function()? onTap;

  @override
  State<LanguageSwitcher> createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  final en = SvgPicture.asset("assets/images/en.svg");
  final vi = SvgPicture.asset("assets/images/vi.svg");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        height: AppDimens.extraLargeHeightDimens,
        width: AppDimens.extraLargeWidthDimens,
        child: context.locale.languageCode == "en" ? en : vi,
      ),
    );
  }
}
