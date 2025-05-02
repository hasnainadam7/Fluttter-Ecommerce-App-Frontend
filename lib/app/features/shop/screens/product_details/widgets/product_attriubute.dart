import 'package:ecommerceapp/app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerceapp/app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerceapp/app/common/widgets/texts/section_heading.dart';
import 'package:ecommerceapp/app/utils/constants/colors.dart';
import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = CHelperFunctions.isDarkMode(context);

    return Column(
      // spacing: CSizes.spaceBtwItems,
      children: [
        CRoundedContainer(
          padding: EdgeInsets.all(CSizes.md),
          backgroundColor: dark ? CColors.darkerGrey : CColors.grey,
          child: Column(
            children: [
              Row(
                spacing: CSizes.spaceBtwItems,
                children: [
                  CSectionHeading(
                    padding: EdgeInsets.zero,
                    title: "Validation",
                    dark: dark,
                    showActionButton: false,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: CSizes.spaceBtwItems,
                        children: [
                          CProductTitleText(title: "Price :", smallSize: true),
                          Row(
                            spacing: CSizes.spaceBtwItems,
                            children: [
                              Text(
                                "\$25",
                                style: Theme.of(
                                  context,
                                ).textTheme.titleSmall!.apply(
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              CProductPriceText(price: "20"),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        spacing: CSizes.spaceBtwItems,
                        children: [
                          CProductTitleText(title: "Stock :", smallSize: true),
                          Text(
                            "In Stock",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              CProductTitleText(
                smallSize: true,
                maxLines: 4,
                title:
                    "This is description of the product and it can go up to max 4 lines ",
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // spacing: CSizes.spaceBtwItems/2,
          children: [
            CSectionHeading(title: "Colors", dark: dark),
            Wrap(
              spacing: 8,
              children: [
                CChoiceChip(selected: true, text: "Red", onSelected: (v) {}),
                CChoiceChip(selected: false, text: "Blue", onSelected: (v) {}),
                CChoiceChip(
                  selected: false,
                  text: "Yellow",
                  onSelected: (v) {},
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // spacing: CSizes.spaceBtwItems / 2,
          children: [
            CSectionHeading(title: "Size", dark: dark),
            Wrap(
              spacing: 8,
              children: [
                CChoiceChip(selected: false, text: "EU 34", onSelected: (v) {}),
                CChoiceChip(selected: true, text: "EU 35", onSelected: (v) {}),
                CChoiceChip(selected: false, text: "EU 36", onSelected: (v) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
