import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/screens/home/widgets/product_card_vertical/circular_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddRemoveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: CSizes.spaceBtwItems,
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

        Text('2', style: Theme.of(context).textTheme.titleSmall),

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
