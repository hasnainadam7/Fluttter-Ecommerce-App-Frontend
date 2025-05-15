import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';
import '../shimmer_effect/shimmer_effect.dart';

class CCircularImage extends StatelessWidget {
  const CCircularImage({
    super.key,
    required this.imgPath,
    this.isNetworkImage = false,
    this.height = CSizes.shopContainerIconsSize,
    this.width = CSizes.shopContainerIconsSize,
    this.padding = CSizes.sm,
    this.overlayColor,
    this.backgroundColor,
    this.fit = BoxFit.cover,
  });

  final String imgPath;
  final bool isNetworkImage;
  final double height, width, padding;
  final Color? overlayColor, backgroundColor;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(100)),
      child:
    (isNetworkImage && imgPath.isNotEmpty)
        ? CachedNetworkImage(
      fit: fit,
      color: overlayColor,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CShimmerEffect(height: height, width: width),
      errorWidget: (context, url, error) => const Icon(Iconsax.info_circle),
      imageUrl: imgPath,
    )
        : (!isNetworkImage)
        ? Image.asset(imgPath, fit: fit, color: overlayColor)
        : const Icon(Iconsax.info_circle),
    );
  }
}
