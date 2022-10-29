import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

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
            imageFit: BoxFit.cover,
            duration: const Duration(seconds: 12),
          ),
        ),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
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
              fit: BoxFit.fill,
            ),
          ),
        ),
      );
}
