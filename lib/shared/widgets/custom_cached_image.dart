import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedImage extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit fit;
  final String? imageUrl;
  final String placeholderAsset;
  const CustomCachedImage({
    Key? key,
    this.width,
    this.height,
    required this.imageUrl,
    required this.placeholderAsset,
    this.fit = BoxFit.fitHeight,
  }) : super(key: key);

  bool get isSVG {
    return placeholderAsset.endsWith('svg');
  }

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      // if (isSVG) {
      //   return SvgPicture.asset(
      //     placeholderAsset,
      //     width: width,
      //     height: height,
      //     fit: fit,
      //     colorBlendMode: BlendMode.luminosity,
      //   );
      // }

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
        // if (isSVG) {
        //   return SvgPicture.asset(
        //     placeholderAsset,
        //     width: width,
        //     height: height,
        //     fit: fit,
        //     colorBlendMode: BlendMode.luminosity,
        //   );
        // }

        return Image.asset(
          placeholderAsset,
          width: width,
          height: height,
          fit: fit,
          colorBlendMode: BlendMode.luminosity,
        );
      },
      errorWidget: (_, __, ___) {
        // if (isSVG) {
        //   return SvgPicture.asset(
        //     placeholderAsset,
        //     width: width,
        //     height: height,
        //     fit: fit,
        //     colorBlendMode: BlendMode.luminosity,
        //   );
        // }

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
