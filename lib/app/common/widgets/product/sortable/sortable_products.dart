import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../cards/product_card_vertical/product_card_vertical.dart';
import '../../layout/grid_layout.dart';

class CSortableProducts extends StatelessWidget {
  const CSortableProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = CHelperFunctions.isDarkMode(context);
    return Column(
      spacing: CSizes.spacesBtwSections,
      children: [
        /// Dropdown
        DropdownButtonFormField(
          items:
              [
                'Name',
                'Higher Price',
                'Lower price',
                'Sale',
                'Newest',
                'Popularity',
              ].map((option) => DropdownMenuItem(value: option, child: Text(option))).toList(),
          onChanged: (value) {},
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        ),

        /// Products
        CGridLayout(
          padding: EdgeInsets.zero,
          itemCount: 8,
          itemBuilder: (_, index) => ProductCardVertical(dark: dark),
          dark: dark,
        ),
      ],
    );
  }
}
