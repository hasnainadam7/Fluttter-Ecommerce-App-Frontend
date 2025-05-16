import 'package:ecommerceapp/app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerceapp/app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerceapp/app/common/widgets/texts/section_heading.dart';
import 'package:ecommerceapp/app/features/shop/controllers/product_controllers/product_variation_controller.dart';
import 'package:ecommerceapp/app/features/shop/models/product_model.dart';
import 'package:ecommerceapp/app/utils/constants/colors.dart';
import 'package:ecommerceapp/app/utils/constants/sizes.dart';
import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    bool dark = CHelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Column(
      spacing: CSizes.spaceBtwItems,
      children: [
        if (controller.selectedVariation.value.id.isNotEmpty)
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
          // spacing: CSizes.defaultSpace,
          children:
              product.productAttributes.map((attriubute) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: CSizes.spaceBtwItems / 2,
                  children: [
                    // SizedBox(height: 10),
                    CSectionHeading(title: attriubute.name, dark: dark, showActionButton: false),
                    Obx(
                      () => Wrap(
                        spacing: 8,
                        children:
                            attriubute.values
                                .map((attriubuteValue) {
                                  final value =
                                      attriubute.name == "Color"
                                          ? attriubuteValue.split(":").last.split("/").first
                                          : attriubuteValue; // ye magic line hai
                                  final isSelected =
                                      controller.selectedAttributes[attriubute.name.toLowerCase()] ==
                                      value.trim();
                                  final available = controller
                                      .getAttributesAvailabilityInVariation(
                                        product.productVariations,
                                        attriubute.name,
                                      )
                                      .contains(attriubuteValue);
                                  print("available $isSelected}");

                                  return CChoiceChip(
                                    selected: isSelected,
                                    text: value,
                                    onSelected:
                                        available
                                            ? (v) {
                                              if (!isSelected && available) {
                                                controller.onAttributeSelected(
                                                  product,
                                                  attriubute.name.toLowerCase(),
                                                  attriubuteValue,
                                                );
                                              }
                                            }
                                            : null,
                                  );
                                })
                                .toSet()
                                .toList(),
                      ),
                    ),
                  ],
                );
                // return SectionColors(dark: dark, title: r.name, list: r.values);
              }).toList(),
        ),
      ],
    );
  }
}

// class SectionColors extends StatelessWidget {
//   const SectionColors({super.key, required this.dark, required this.title, required this.list});
//   final String title;
//   final bool dark;
//   final List<String> list;
//   @override
//   Widget build(BuildContext context) {
//     final controller = VariationController.instance;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       spacing: CSizes.spaceBtwItems / 2,
//       children: [
//         // SizedBox(height: 10),
//         CSectionHeading(title: title, dark: dark, showActionButton: false),
//         Wrap(
//           spacing: 8,
//           children:
//               list
//                   .map((r) {
//                     // print(r); // optional for debugging
//                     final value =
//                         title == "Color"
//                             ? r.split(": ").last.split("/").first
//                             : r; // ye magic line hai
//                     final isSelected = controller.selectedAttributes[title]==value;
//                     final available= controller.getAttributesAvailabilityInVariation(pro, attributeName)
//                     print(isSelected);
//                     print(controller.selectedAttributes[title]);
//                     print(value);
//                     return CChoiceChip(selected: isSelected, text: value, onSelected: (v) {});
//                   })
//                   .toSet()
//                   .toList(),
//         ),
//       ],
//     );
//   }
// }
