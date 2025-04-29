import 'package:flutter/material.dart';

import '../../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';

class DiscountedLabelWidget extends StatelessWidget {
  const DiscountedLabelWidget({super.key, required this.discount});

  final double discount;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: CSizes.sm,
      top: CSizes.sm,
      child: CRoundedContainer(
        padding: const EdgeInsets.symmetric(horizontal: CSizes.sm, vertical: CSizes.xs),
        radius: CSizes.sm,
        backgroundColor: CColors.secondaryColor.withValues(alpha: 0.8),
        child: Text(
          "${discount.toInt()}%",
          style: Theme.of(context).textTheme.labelLarge!.apply(color: CColors.black),
        ),
      ),
    );
  }
}