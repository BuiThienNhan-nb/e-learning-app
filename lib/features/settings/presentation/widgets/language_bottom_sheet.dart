import 'package:e_learning_app/configs/colors.dart';
import 'package:e_learning_app/configs/dimens.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.fireEngineRedColor,
      height: AppDimens.extraLargeHeightDimens * 8,
    );
  }
}
