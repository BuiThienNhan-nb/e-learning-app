import 'package:e_learning_app/utils/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryIcon extends StatelessWidget {
  final defaultStringSvg =
      '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1 1"></svg>';

  /// Default color and size of icon in file svg
  final String defaultColor;

  /// Path to icon svg file
  final String icon;

  /// Color of icon
  final Color color;

  /// width of icon
  final double width;

  /// height of icon
  final double height;

  /// Fit of icon
  final BoxFit fit;

  const PrimaryIcon({
    super.key,
    required this.icon,
    required this.defaultColor,
    this.color = Colors.black,
    this.width = double.infinity,
    this.height = double.infinity,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString(icon),
        builder: (context, snapshot) {
          return SvgPicture.string(
            (snapshot.data ?? defaultStringSvg)
                .replaceAll(defaultColor, color.toHexTriplet()),
            width: width,
            height: height,
            fit: fit,
          );
        });
  }
}
