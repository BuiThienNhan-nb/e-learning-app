import 'package:e_learning_app/configs/colors.dart';
import 'package:flutter/material.dart';

class TagList extends StatelessWidget {
  const TagList({
    super.key,
    required this.tags,
    this.titleStyle,
    this.title = 'Tag list',
    required this.onTagTap,
    this.alignment = Alignment.centerLeft,
    this.paddingWrap = EdgeInsets.zero,
    this.spacing = 0.0,
  });

  final List<String> tags;
  final TextStyle? titleStyle;
  final String title;
  final Function(String) onTagTap;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry? paddingWrap;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
          alignment: alignment,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: titleStyle ?? Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: paddingWrap!,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: spacing,
              runSpacing: 7,
              children: tags
                  .map(
                    (tag) => InkWell(
                      onTap: () => onTagTap(tag),
                      child: WTagItem(title: tag),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class WTagItem extends StatelessWidget {
  const WTagItem({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.lineLightBasic),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
