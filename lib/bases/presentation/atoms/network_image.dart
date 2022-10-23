import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DefaultNetworkImage extends StatelessWidget {
  const DefaultNetworkImage({
    super.key,
    required this.url,
    required this.height,
    required this.width,
    this.shape,
    this.borderRadius,
  });

  final String url;
  final double height;
  final double width;
  final BoxShape? shape;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
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
