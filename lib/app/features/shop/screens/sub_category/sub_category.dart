import 'package:ecommerceapp/app/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appBar/app_bar.dart';
import '../../../../common/widgets/cards/product_card_horizontal/product_card_horizontal.dart';
import '../../../../common/widgets/images/rounded_images.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = CHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const CAppBar(title: Text('Sports'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const CRoundedImages(
                imgUrl: CImages.promoBanner2,
                applyImgRadius: true,
                width: double.infinity,
              ),
              const SizedBox(height: CSizes.spacesBtwSections),

              /// Sub-Categories
              Column(
                children: [
                  /// Heading
                  CSectionHeading(title: 'Sports shirts', onPressed: () {Get.to(()=> const AllProducts());}, dark: dark),
                  const SizedBox(height: CSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder:
                          (context, index) => const SizedBox(width: CSizes.spaceBtwItems),
                      itemBuilder: (context, index) =>
                       const CProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
