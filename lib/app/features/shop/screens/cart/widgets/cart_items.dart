import 'package:flutter/material.dart';

import '../../../../../common/widgets/cards/add_remove_button.dart';
import '../../../../../common/widgets/cards/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class CCartItems extends StatelessWidget {
  const CCartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: CSizes.spaceBtwSections),
      itemCount: 5,
      itemBuilder:
          (_, index) => Column(
            children: [
              /// Cart Item
              const CCartItem(),
              if (showAddRemoveButton) const SizedBox(height: CSizes.spaceBtwItems),

              /// Add Remove Button Row with total Price
              if (showAddRemoveButton)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        /// (for the extra space)
                        SizedBox(width: 70),

                        /// Add Remove Buttons
                        CProductQuantityWithAddRemoveButton(),
                      ],
                    ),

                    /// -- Product Total Price
                    CProductPriceText(price: '256'),
                  ],
                ),
            ],
          ),
    );
  }
}
