import 'package:ecommerceapp/app/common/styles/shadow_styles.dart';
import 'package:ecommerceapp/app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerceapp/app/features/shop/screens/home/widgets/product_card_vertical/product_price_and_counts.dart';

import 'package:ecommerceapp/app/features/shop/screens/home/widgets/product_card_vertical/product_title.dart';
import 'package:ecommerceapp/app/routes/routes.dart';
import 'package:ecommerceapp/app/utils/constants/colors.dart';
import 'package:ecommerceapp/app/utils/constants/images_string.dart';
import 'package:ecommerceapp/app/utils/constants/sizes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/images/rounded_images.dart';
import '../../../../../../common/widgets/texts/rounded_title_with_text_verified_logo.dart';
import 'circular_icon.dart';
import 'discounted_label.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.dark});
  final bool dark;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Get.toNamed(Routes.productDetails),
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
              child: Stack(
                children: [
                  const CRoundedImages(

                    imgUrl: CImages.productImage1,
                  ),
                  const DiscountedLabelWidget(discount: 25),
                  Positioned(right: 2, top: 2, child: CircularIcon(dark: dark)),
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
                  CRoundedTitleWithTextVerifiedLogo(title: "Nike"),
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
