import 'package:e_learning_app/configs/colors.dart';
import 'package:flutter/material.dart';

class WLabelContainer extends StatelessWidget {
  const WLabelContainer({
    super.key,
    required this.color,
    required this.title,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: color,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColors.textDarkBasic,
            ),
      ),
    );
  }
}
