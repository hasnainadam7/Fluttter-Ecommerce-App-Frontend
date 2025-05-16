import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../features/shop/models/product_model.dart';
import '../../../../../features/shop/screens/product_details/product_details.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../custom_shapes/containers/rounded_container.dart';
import '../../../images/rounded_images.dart';
import '../../../texts/brand_title_text_with_verified_icon.dart';
import '../../../texts/product_price_text.dart';
import '../../../texts/product_title_text.dart';

import '../favourite_icon.dart';

class CProductCardHorizontal extends StatelessWidget {
  const CProductCardHorizontal({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final String discountedPercentage =
        "${(100 - (productModel.salePrice / productModel.price) * 100).toInt()}%";

    final dark = CHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetails(product: productModel)),
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(CSizes.productImgRadius),
          color: dark ? CColors.darkerGrey : CColors.softGrey,
        ),
        child: Row(
          children: [
            /// Thumbnail
            CRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(CSizes.sm),
              backgroundColor: dark ? CColors.dark : CColors.light,
              child: Stack(
                children: [
                  /// -- Thumbnail Image
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: CRoundedImages(
                      isNetworkImage: true,
                      imgUrl: productModel.thumbnail,
                      applyImgRadius: true,
                    ),
                  ),

                  Positioned(
                    top: 12,
                    child: CRoundedContainer(
                      radius: CSizes.sm,
                      backgroundColor: CColors.secondaryColor.withValues(alpha: 0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: CSizes.sm,
                        vertical: CSizes.xs,
                      ),
                      child: Text(
                        discountedPercentage,
                        style: Theme.of(context).textTheme.labelLarge!.apply(color: CColors.black),
                      ),
                    ),
                  ),

                  /// -- Favorite Icon Button
                  Positioned(top: 0, right: 0, child: CFavouriteIcon(id: productModel.id)),
                ],
              ),
            ),

            /// Details
            SizedBox(
              width: 172,
              child: Padding(
                padding: const EdgeInsets.only(top: CSizes.sm, left: CSizes.sm),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CProductTitleText(title: productModel.title, smallSize: true),
                        const SizedBox(height: CSizes.spaceBtwItems / 2),
                        CBrandTitleWithVerifiedIcon(title: productModel.brand!.name),
                      ],
                    ),

                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Pricing
                        Flexible(
                          child: CProductPriceText(price: productModel.salePrice.toString()),
                        ),

                        /// Add to Cart Button
                        Container(
                          decoration: const BoxDecoration(
                            color: CColors.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(CSizes.cardRadiusMd),
                              bottomRight: Radius.circular(CSizes.productImgRadius),
                            ),
                          ),
                          child: const SizedBox(
                            width: CSizes.iconsLg * 1.2,
                            height: CSizes.iconsLg * 1.2,
                            child: Center(child: Icon(Iconsax.add, color: CColors.white)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
