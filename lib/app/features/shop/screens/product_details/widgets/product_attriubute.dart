import 'package:ecommerceapp/app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerceapp/app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerceapp/app/common/widgets/texts/section_heading.dart';
import 'package:ecommerceapp/app/features/shop/models/product_model.dart';
import 'package:ecommerceapp/app/utils/constants/colors.dart';
import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    bool dark = CHelperFunctions.isDarkMode(context);

    return Column(
      // spacing: CSizes.spaceBtwItems,
      children: [
        CRoundedContainer(
          padding: const EdgeInsets.all(CSizes.md),
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
                          const CProductTitleText(title: "Price :", smallSize: true),
                          Row(
                            spacing: CSizes.spaceBtwItems,
                            children: [
                              Text(
                                "\$25",
                                style: Theme.of(context).textTheme.titleSmall!.apply(
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              const CProductPriceText(price: "20"),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        spacing: CSizes.spaceBtwItems,
                        children: [
                          const CProductTitleText(title: "Stock :", smallSize: true),
                          Text("In Stock", style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const CProductTitleText(
                smallSize: true,
                maxLines: 4,
                title: "This is description of the product and it can go up to max 4 lines ",
              ),
            ],
          ),
        ),
        Column(
          spacing: 10,
          children: [
            SectionColors(
              dark: dark,
              title: product.productAttributes[0].name,
              list: product.productAttributes[0].values,
            ),
            SectionSizes(
              dark: dark,
              title: product.productAttributes[1].name,
              list: product.productAttributes[1].values,
            ),
          ],
        ),
      ],
    );
  }
}

class SectionSizes extends StatelessWidget {
  const SectionSizes({super.key, required this.dark, required this.title, required this.list});
  final String title;
  final bool dark;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: CSizes.spaceBtwItems / 2,
      children: [
        CSectionHeading(title: title, dark: dark, showActionButton: false),
        Wrap(
          spacing: 8,
          children:
              list.map((r) {
                return CChoiceChip(selected: false, text: r, onSelected: (v) {});
              }).toList(),
          // [
          //  ,
          //   CChoiceChip(selected: true, text: "EU 35", onSelected: (v) {}),
          //   CChoiceChip(selected: false, text: "EU 36", onSelected: (v) {}),
          // ],
        ),
      ],
    );
  }
}

class SectionColors extends StatelessWidget {
  const SectionColors({super.key, required this.dark, required this.title, required this.list});
  final String title;
  final bool dark;
  final List<String> list;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: CSizes.spaceBtwItems / 2,
      children: [
        CSectionHeading(title: title, dark: dark, showActionButton: false),

        Wrap(
          spacing: 8,
          children:
              list.map((r) {
print(r);
                return CChoiceChip(selected: false, text: r, onSelected: (v) {});
              }).toList(),
          // [
          //  ,
          //   CChoiceChip(selected: true, text: "EU 35", onSelected: (v) {}),
          //   CChoiceChip(selected: false, text: "EU 36", onSelected: (v) {}),
          // ],
        ),
      ],
    );
  }
}
