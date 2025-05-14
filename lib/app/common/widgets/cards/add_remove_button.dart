
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'product_card/circular_icon.dart';

class CProductQuantityWithAddRemoveButton extends StatelessWidget {
  const CProductQuantityWithAddRemoveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: CSizes.md,
          color: CHelperFunctions.isDarkMode(context) ? CColors.white : CColors.black,
          backgroundColor:
              CHelperFunctions.isDarkMode(context) ? CColors.darkerGrey : CColors.light,
        ),
        const SizedBox(width: CSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: CSizes.spaceBtwItems),
        const CCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: CSizes.md,
          color: CColors.white,
          backgroundColor: CColors.primaryColor,
        ),
      ],
    );
  }
}
