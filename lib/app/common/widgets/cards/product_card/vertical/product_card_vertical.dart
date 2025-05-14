import 'package:ecommerceapp/app/common/styles/shadow_styles.dart';
import 'package:ecommerceapp/app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerceapp/app/features/shop/screens/cart/cart.dart';

import 'package:ecommerceapp/app/utils/constants/colors.dart';
import 'package:ecommerceapp/app/utils/constants/images_string.dart';
import 'package:ecommerceapp/app/utils/constants/sizes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../images/rounded_images.dart';
import '../../../texts/brand_title_text_with_verified_icon.dart';
import '../circular_icon.dart';
import '../discounted_label.dart';
import '../product_price_and_counts.dart';
import '../product_title.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({
    super.key,
    required this.dark,
    required this.imgPath,
    required this.productTitle,
    required this.categoryTitle,
    required this.price,
    required this.discountedPrice,
  });
  final String imgPath, productTitle, categoryTitle;
  final double price, discountedPrice;
  final bool dark;
  @override
  Widget build(BuildContext context) {
    final double discountedPercentage = discountedPrice / price * 100;
    return GestureDetector(
      onTap: () => Get.to(() => const CartScreen()),
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

              backgroundColor: dark ? CColors.darkerGrey : CColors.light,
              child: Stack(
                children: [
                  CRoundedImages(
                    fit: BoxFit.fitWidth,
                    height: 150,
                    width: double.infinity,
                    isNetworkImage: true,
                    imgUrl: imgPath,
                  ),
                  DiscountedLabelWidget(discount: discountedPercentage),
                  Positioned(
                    right: 2,
                    top: 2,
                    child: CCircularIcon(color: Colors.blue, icon: Iconsax.heart5),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(CSizes.sm),
              child: Column(
                // spacing: CSizes.spaceBtwItems / 2,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  ProductTitle(title: productTitle),
                  CBrandTitleWithVerifiedIcon(title: categoryTitle),
                  ProductPriceAndCounts(price: discountedPrice.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
