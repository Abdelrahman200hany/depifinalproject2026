import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNewtorkimage extends StatelessWidget {
  final String imageUrl;
  final int? imageVersion;
  final double? height;
  final double? width;
  final BoxFit fit;

  const CustomCachedNewtorkimage({
    super.key,
    required this.imageUrl,
    this.imageVersion,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    final cacheKey = imageVersion != null
        ? "$imageUrl-$imageVersion"
        : imageUrl;

    return CachedNetworkImage(
      imageUrl: imageUrl,
      cacheKey: cacheKey,
      height: height,
      width: width,
      fit: fit,

      errorWidget: (context, url, error) =>
          const Icon(Icons.broken_image, size: 40),
    );
  }
}
