import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import 'brand_title_text.dart';

class CRoundedTitleWithTextVerifiedLogo extends StatelessWidget {
  const CRoundedTitleWithTextVerifiedLogo({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = CColors.primaryColor,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });
  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: CBrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: CSizes.xs),
        Icon(Iconsax.verify5, color: iconColor, size: CSizes.iconsXs),
      ],
    );
  }
}
