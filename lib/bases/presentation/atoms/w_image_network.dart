import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning_app/configs/colors.dart';
import 'package:flutter/material.dart';

class WImageNetwork extends StatelessWidget {
  const WImageNetwork({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.fill,
  });

  final String imageUrl;
  final double? height;
  final BoxFit fit;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      imageUrl: imageUrl,
      width: width,
      height: height,
      placeholder: (context, url) => Container(
        constraints: const BoxConstraints.expand(),
        color: AppColors.placeholderLightMode,
      ),
      errorWidget: (context, url, error) => const Placeholder(),
    );
  }
}
