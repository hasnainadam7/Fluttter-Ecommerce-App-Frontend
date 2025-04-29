import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

import '../../../utils/constants/sizes.dart';

class CCircularImage extends StatelessWidget {
  const CCircularImage({
    super.key,
    required this.imgPath,
    this.isNetworkImage = false,
    this.height = CSizes.shopContainerIconsSize,
    this.width = CSizes.shopContainerIconsSize,
    this.padding = CSizes.sm,
    this.overlayColor = CColors.dark,
    this.backgroundColor = CColors.white,
    this.fit = BoxFit.cover,
  });


  final String imgPath;
  final bool isNetworkImage;
  final double height, width, padding;
  final Color overlayColor, backgroundColor;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child:
          !isNetworkImage
              ? Image.asset(imgPath, fit: fit, color: overlayColor)
              : Image.network(imgPath, fit: fit, color: overlayColor),
    );
  }
}
