import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class CBillingAmountSection extends StatelessWidget {
  const CBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: CSizes.spaceBtwItems / 2,
      children: [
        /// Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$256.0', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),

        /// Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$6.0', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),

        /// Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$6.0', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),

        /// Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$256.0', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
