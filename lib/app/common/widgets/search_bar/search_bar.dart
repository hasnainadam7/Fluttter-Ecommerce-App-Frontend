import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';

class CSearchBar extends StatelessWidget {
  const CSearchBar({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    required this.dark,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
  });
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final String text;
  final IconData icon;
  final bool showBackground, showBorder;
  final bool dark;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: padding,
        child: Container(
          width: CDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(CSizes.md),
          decoration: BoxDecoration(
            color:
                showBackground
                    ? dark
                        ? CColors.dark
                        : CColors.light
                    : CColors.transparent,
            borderRadius: BorderRadius.circular(CSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: CColors.grey) : null,
          ),
          child: Row(
            spacing: CSizes.spaceBtwItems,
            children: [
              Icon(icon, color: CColors.darkerGrey),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
