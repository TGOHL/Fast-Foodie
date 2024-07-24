import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedImage extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit fit;
  final String? imageUrl;
  final String placeholderAsset;
  const CustomCachedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    required this.placeholderAsset,
    this.fit = BoxFit.fitHeight,
  });

  bool get isSVG {
    return placeholderAsset.endsWith('svg');
  }

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return Image.asset(
        placeholderAsset,
        width: width,
        height: height,
        fit: fit,
        colorBlendMode: BlendMode.luminosity,
      );
    }
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: fit,
      imageUrl: imageUrl!,
      placeholderFadeInDuration: const Duration(milliseconds: 300),
      fadeInDuration: const Duration(milliseconds: 300),
      fadeOutDuration: const Duration(milliseconds: 300),
      placeholder: (_, __) {
        return Image.asset(
          placeholderAsset,
          width: width,
          height: height,
          fit: fit,
          colorBlendMode: BlendMode.luminosity,
        );
      },
      errorWidget: (_, __, ___) {
        return Image.asset(
          placeholderAsset,
          width: width,
          height: height,
          fit: fit,
          colorBlendMode: BlendMode.luminosity,
        );
      },
    );
  }
}
