import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning_app/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        fit: fit,
        imageUrl: imageUrl,
        width: width,
        height: height,
        placeholder: (context, url) => Container(
          // constraints: const BoxConstraints.expand(),
          color: AppColors.placeholderLightMode,
        ),
        errorWidget: (context, url, error) => Container(
          // constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.lineBasic),
              borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.all(4),
          child: SvgPicture.asset(
            "assets/icons/empty_image.svg",
            color: AppColors.appColorBlue,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
