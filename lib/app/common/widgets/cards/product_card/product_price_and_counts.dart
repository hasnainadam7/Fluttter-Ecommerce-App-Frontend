import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class ProductPriceAndCounts extends StatelessWidget {
  const ProductPriceAndCounts({
    super.key,
    required this.price,
    this.isLarge = false,
    this.lineThrough = false,
    this.maxLines = 1,
    this.currencySign = '\$',
  });
  final String price;
  final bool isLarge, lineThrough;
  final int maxLines;
  final String currencySign;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "\$$price",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:
              isLarge
                  ? Theme.of(context).textTheme.headlineMedium!.apply(
                    decoration: lineThrough ? TextDecoration.lineThrough : null,
                  )
                  : Theme.of(context).textTheme.titleLarge!.apply(
                    decoration: lineThrough ? TextDecoration.lineThrough : null,
                  ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: CColors.dark,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(CSizes.cardRadiusMd),
              bottomRight: Radius.circular(CSizes.cardRadiusMd),
            ),
          ),
          child: const SizedBox(
            height: CSizes.iconsLg * 1.2,
            width: CSizes.iconsLg * 1.2,
            child: Icon(Iconsax.add, color: CColors.white),
          ),
        ),
      ],
    );
  }
}
