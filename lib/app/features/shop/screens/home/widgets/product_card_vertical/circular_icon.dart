import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({
    super.key,
    required this.dark,
    this.iconData = Iconsax.heart5,
    this.onTap,
    this.iconColor = Colors.red,
  });

  final bool dark;
  final IconData iconData;
  final VoidCallback? onTap;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: CSizes.lg * 2,
      width: CSizes.lg * 2,
      decoration: BoxDecoration(
        color: !dark ? CColors.white.withValues(alpha: 0.9) : CColors.black.withValues(alpha: 0.9),

        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: IconButton(
          onPressed: onTap,
          icon: Icon(size: CSizes.lg, iconData, color: iconColor),
        ),
      ),
    );
  }
}
