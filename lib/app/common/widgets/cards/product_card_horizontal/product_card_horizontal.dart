
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../images/rounded_images.dart';
import '../../texts/brand_title_text_with_verified_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';
import '../product_card_vertical/circular_icon.dart';

class CProductCardHorizontal extends StatelessWidget {
  const CProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
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
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: CRoundedImages(
                    imgUrl: CImages.productImage1,
                    applyImgRadius: true,
                  ),
                ),

                Positioned(
                  top: 12,
                  child: CRoundedContainer(
                    radius: CSizes.sm,
                    backgroundColor: CColors.secondaryColor.withValues(alpha: 0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: CSizes.sm, vertical: CSizes.xs),
                    child: Text(
                      '25%',
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: CColors.black,
                      ),
                    ),
                  ),
                ),

                /// -- Favorite Icon Button
                const Positioned(
                  top: 0,
                  right: 0,
                  child: CCircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                ),
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CProductTitleText(
                        title: 'Green Nike Half Sleeves Shirt',
                        smallSize: true,
                      ),
                      SizedBox(height: CSizes.spaceBtwItems / 2),
                      CBrandTitleWithVerifiedIcon(title: 'Nike'),
                    ],
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      const Flexible(child: CProductPriceText(price: '256.0')),

                      /// Add to Cart Button
                      Container(
                        decoration: const BoxDecoration(
                          color: CColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(CSizes.cardRadiusMd),
                            bottomRight:
                            Radius.circular(CSizes.productImgRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width:CSizes.iconsLg * 1.2,
                          height: CSizes.iconsLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: CColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
