import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_learning_app/configs/colors.dart';
import 'package:flutter/material.dart';

class RankingTitle extends StatelessWidget {
  const RankingTitle(
      {Key? key, required this.rankingTitle, required this.rankingIndex})
      : super(key: key);
  final String rankingTitle;
  final int rankingIndex;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.centerLeft,
      widthFactor: 0.8,
      child: Row(
        children: [
          Expanded(
            flex: 111,
            child: Text(
              '$rankingIndex',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.appColorBlue,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'SF Pro Display',
                  ),
            ),
          ),
          Expanded(
            flex: 888,
            child: AutoSizeText(
              rankingTitle,
              maxLines: 2,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }
}
