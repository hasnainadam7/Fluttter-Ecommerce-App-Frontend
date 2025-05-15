import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product_controllers/product_controller.dart';

import '../../cards/product_card/vertical/product_card_vertical.dart';
import '../../layout/grid_layout.dart';

class CSortableProducts extends StatelessWidget {
  const CSortableProducts({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    final bool dark = CHelperFunctions.isDarkMode(context);

    final filteredProducts =
        ProductController.instance.allProducts.where((product) => product.brand?.id == id).toList();

    return Column(
      spacing: CSizes.defaultSpace,
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

        /// Filtered Products Grid
        CGridLayout(
          padding: EdgeInsets.zero,
          itemCount: filteredProducts.length,
          itemBuilder: (_, index) {
            final product = filteredProducts[index];
            return ProductCardVertical(dark: dark, productModel: product);
          },
          dark: dark,
        ),
      ],
    );
  }
}
