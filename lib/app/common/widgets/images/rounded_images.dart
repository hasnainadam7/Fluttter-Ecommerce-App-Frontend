import '../../../utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/constants/sizes.dart';

class CRoundedImages extends StatelessWidget {
  const CRoundedImages({
    super.key,
    required this.imgUrl,
    this.applyImgRadius = true,
    this.isNetworkImage = false,
    this.border,
    this.backgroundColor = CColors.light,
    this.fit = BoxFit.contain,
    this.onPressed,
    this.height = 158,
    this.width = 400,
    this.padding,
    this.borderRadius = CSizes.md,
  });
  final double height, width, borderRadius;

  final String imgUrl;
  final bool applyImgRadius, isNetworkImage;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: border,

          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImgRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          child:
              !isNetworkImage
                  ? Image.asset(imgUrl, fit: fit)
                  : Image.network(imgUrl, fit: fit),
        ),
      ),
    );
  }
}
