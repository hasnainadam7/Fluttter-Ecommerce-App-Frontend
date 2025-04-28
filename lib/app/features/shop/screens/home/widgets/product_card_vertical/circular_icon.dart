import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: CSizes.lg,
      // width: CSizes.lg,
      decoration: BoxDecoration(
        color:
        !isDark ? CColors.white.withValues(alpha: 0.9) : CColors.black.withValues(alpha: 0.9),

        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: IconButton(
          onPressed: () {},
          icon: Icon(size: CSizes.lg, Iconsax.heart5, color: Colors.red),
        ),
      ),
    );
  }
}
