import 'package:ecommerceapp/app/common/widgets/texts/section_heading.dart';
import 'package:ecommerceapp/app/features/shop/controllers/product_controllers/image_slider_controller.dart';
import 'package:ecommerceapp/app/features/shop/models/product_model.dart';
import 'package:ecommerceapp/app/features/shop/screens/checkout/checkout.dart';
import 'package:ecommerceapp/app/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'widgets/bottom_add_to_cart.dart';
import 'widgets/product_attriubute.dart';
import 'widgets/product_image_slider.dart';
import 'widgets/product_meta_data.dart';
import '../product_reviews/product_review_screen.dart';
import 'widgets/rating_share.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    bool dark = CHelperFunctions.isDarkMode(context);

    return Scaffold(
      // appBar:
      bottomNavigationBar: const CBottomAddToCart(),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            ProductImageSlider(dark: dark, product: product),
            Padding(
              padding: const EdgeInsets.only(
                right: CSizes.defaultSpace,
                left: CSizes.defaultSpace,
                bottom: CSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  const CRatingAndShare(),
                  ProductMetaData(product: product),
                  const SizedBox(height: CSizes.defaultSpace / 3),
                  if (product.productType == ProductType.variable) ProductAttributes(product: product,),
                  if (product.productType == ProductType.variable)
                    const SizedBox(height: CSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const CheckoutScreen());
                      },
                      child: const Text("Check Out"),
                    ),
                  ),
                  const SizedBox(height: CSizes.spaceBtwSections),
                  CSectionHeading(title: "Description", showActionButton: false, dark: dark),
                  const SizedBox(height: CSizes.sm),
                  ReadMoreText(
                    product.description,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const Divider(),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CSectionHeading(dark: dark, title: 'Reviews(199)', showActionButton: false),
                      IconButton(
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                        onPressed: () => Get.to(() => const ProductReviewScreen()),
                      ),
                    ],
                  ),
                  // const SizedBox(height: CSizes.spacesBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
