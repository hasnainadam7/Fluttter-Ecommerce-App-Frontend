import 'package:ecommerceapp/app/common/styles/shadow_styles.dart';
import 'package:ecommerceapp/app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerceapp/app/features/shop/screens/cart/cart.dart';

import 'package:ecommerceapp/app/utils/constants/colors.dart';
import 'package:ecommerceapp/app/utils/constants/images_string.dart';
import 'package:ecommerceapp/app/utils/constants/sizes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../images/rounded_images.dart';
import '../../texts/brand_title_text_with_verified_icon.dart';
import 'circular_icon.dart';
import 'discounted_label.dart';
import 'product_price_and_counts.dart';
import 'product_title.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.dark});
  final bool dark;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Get.to(const CartScreen()),
      child: Container(

        width: Get.width * 0.4,
        decoration: BoxDecoration(
          boxShadow: CShadowStyles.verticalProductShadow,
          borderRadius: BorderRadius.circular(CSizes.productImgRadius),
          color: dark ? CColors.darkerGrey : CColors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //thumbnail wishlist and discountedTag
            CRoundedContainer(

              // padding: EdgeInsets.all(CSizes.sm),
              backgroundColor: dark ? CColors.darkerGrey : CColors.light,
              child: const Stack(
                children: [
                  CRoundedImages(

                    imgUrl: CImages.productImage1,
                  ),
                  DiscountedLabelWidget(discount: 25),
                  Positioned(right: 2, top: 2, child: CCircularIcon(
                    color: Colors.red,
                    icon: Iconsax.heart5,)),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(CSizes.sm),
              child: Column(
                // spacing: CSizes.spaceBtwItems / 2,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  ProductTitle(title: "Green Nike Air Shoes"),
                  CBrandTitleWithVerifiedIcon(title: "Nike"),
                  ProductPriceAndCounts(price: '35.5'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
