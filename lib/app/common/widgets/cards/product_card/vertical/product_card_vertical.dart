import 'package:ecommerceapp/app/common/styles/shadow_styles.dart';
import 'package:ecommerceapp/app/common/widgets/custom_shapes/containers/rounded_container.dart';

import 'package:ecommerceapp/app/utils/constants/colors.dart';
import 'package:ecommerceapp/app/utils/constants/sizes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../features/shop/models/product_model.dart';
import '../../../../../features/shop/screens/product_details/product_details.dart';
import '../../../images/rounded_images.dart';
import '../../../texts/brand_title_text_with_verified_icon.dart';
import '../discounted_label.dart';
import '../favourite_icon.dart';
import '../product_price_and_counts.dart';
import '../product_title.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.productModel, required this.dark});

  final ProductModel productModel;
  final bool dark;
  @override
  Widget build(BuildContext context) {
    final String discountedPercentage = "${(100- (productModel.salePrice / productModel.price) * 100).toInt()}%";
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetails(product: productModel)),
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
                    imgUrl: productModel.thumbnail,
                  ),
                  DiscountedLabelWidget(discount: discountedPercentage),
                  const Positioned(
                    right: 2,
                    top: 2,
                    child: CFavouriteIcon(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(CSizes.sm),
              child: Column(
                // spacing: CSizes.spaceBtwItems / 2,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  ProductTitle(title: productModel.title),
                  CBrandTitleWithVerifiedIcon(title: productModel.brand!.name),
                  ProductPriceAndCounts(price: productModel.salePrice.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
