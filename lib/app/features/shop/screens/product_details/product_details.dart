import 'package:ecommerceapp/app/common/widgets/texts/section_heading.dart';
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
import 'widgets/product_review_screen.dart';
import 'widgets/rating_share.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = CHelperFunctions.isDarkMode(context);

    return Scaffold(
      // appBar:
      bottomNavigationBar: CBottomAddToCart(),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            ProductImageSlider(dark: dark),
            Padding(
              padding: EdgeInsets.only(
                right: CSizes.defaultSpace,
                left: CSizes.defaultSpace,
                bottom: CSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  CRatingAndShare(),
                  ProductMetaData(),
                  ProductAttributes(),
                  SizedBox(height: CSizes.spacesBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Check Out"),
                    ),
                  ),
                  SizedBox(height: CSizes.spacesBtwSections),
                  CSectionHeading(
                    title: "Description",
                    showActionButton: false,
                    dark: dark,
                  ),
                  SizedBox(height: CSizes.spacesBtwSections),
                  const ReadMoreText(
                    'This is product description for product here in the screen. This is a demo description. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque mattis nulla ante, sed bibendum justo laoreet sed. Etiam nulla enim, consectetur id nulla in, lacinia tempor ipsum.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CSectionHeading(dark: dark,
                          title: 'Reviews(199)', showActionButton: false),
                      IconButton(
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                        onPressed: () => Get.to(() =>  ProductReviewScreen()),
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


