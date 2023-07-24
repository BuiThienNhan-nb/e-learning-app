import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning_app/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultNetworkImage extends StatelessWidget {
  const DefaultNetworkImage({
    super.key,
    required this.imageUrl,
    required this.blurHash,
    required this.height,
    required this.width,
    this.shape,
    this.borderRadius,
  });

  final String imageUrl;
  final String blurHash;
  final double height;
  final double width;
  final BoxShape? shape;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
        placeholder: (context, url) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            shape: shape ?? BoxShape.circle,
            borderRadius: borderRadius != null
                ? BorderRadius.circular(borderRadius!)
                : null,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: BlurHash(
            hash: blurHash,
            imageFit: BoxFit.fill,
            duration: const Duration(seconds: 12),
          ),
        ),
        errorWidget: (context, url, error) {
          print(error.toString());
          return Container(
            constraints: const BoxConstraints.expand(),
            height: height,
            width: width,
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
          );
        },
        imageBuilder: (context, imageProvider) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            shape: shape ?? BoxShape.circle,
            borderRadius: borderRadius != null
                ? BorderRadius.circular(borderRadius!)
                : null,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
}
