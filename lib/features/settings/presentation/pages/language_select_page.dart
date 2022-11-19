import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/configs/dimens.dart';
import 'package:flutter/material.dart';

import '../../../../configs/languages.dart';
import '../../../../configs/styles.dart';
import '../widgets/setting_app_bar.dart';

class LanguageSelectPage extends StatefulWidget {
  const LanguageSelectPage({super.key});

  @override
  State<LanguageSelectPage> createState() => _LanguageSelectPageState();
}

class _LanguageSelectPageState extends State<LanguageSelectPage> {
  final List<String> values = AppLanguages.appSupportedLanguages..sort();
  late String selectedValue =
      values.firstWhere((element) => element == "English");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingAppBar(title: "Language"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            AppDimens.extraLargeWidthDimens,
            0,
            AppDimens.extraLargeWidthDimens,
            AppDimens.extraLargeWidthDimens,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: values
                .map(
                  (e) => LanguageRadioButton(
                    title: e,
                    value: e,
                    groupValue: selectedValue,
                    onChanged: (value) => setState(() => selectedValue = value),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class LanguageRadioButton extends StatelessWidget {
  LanguageRadioButton({
    super.key,
    required this.title,
    required this.value,
    this.groupValue,
    required this.onChanged,
  });

  final String title;
  final String value;
  String? groupValue;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.14,
      child: RadioListTile<String>(
        activeColor: AppColors.primaryColor,
        controlAffinity: ListTileControlAffinity.trailing,
        value: value,
        groupValue: groupValue,
        onChanged: (value) => onChanged!(value!),
        title: Text(
          value,
          style: AppStyles.headline6TextStyle,
        ),
      ),
    );
  }
}
