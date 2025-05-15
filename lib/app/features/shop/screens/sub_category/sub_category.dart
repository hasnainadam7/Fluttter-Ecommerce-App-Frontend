import 'package:ecommerceapp/app/features/shop/models/category_model.dart';
import 'package:ecommerceapp/app/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appBar/app_bar.dart';
import '../../../../common/widgets/cards/product_card/horizontal/product_card_horizontal.dart';

import '../../../../common/widgets/images/rounded_images.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product_controllers/product_controller.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    final bool dark = CHelperFunctions.isDarkMode(context);

    // Filtered list of products based on categoryModel.id matching brand.id
    final filteredProducts =
        ProductController.instance.allProducts
            .where((product) => product.brand?.id == categoryModel.id)
            .toList();

    return Scaffold(
      appBar: CAppBar(title: Text(categoryModel.name), showBackArrow: true),
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
              const SizedBox(height: CSizes.spaceBtwSections),

              /// Sub-Categories
              Column(
                children: [
                  /// Heading
                  CSectionHeading(
                    title: categoryModel.name,
                    onPressed: () {
                      Get.to(() => AllProducts(id: (categoryModel.id)));
                    },
                    dark: dark,
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems / 2),

                  /// Product List
                  filteredProducts.isNotEmpty
                      ? SizedBox(
                        height: 120,
                        child: ListView.separated(
                          itemCount: filteredProducts.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder:
                              (context, index) => const SizedBox(width: CSizes.spaceBtwItems),
                          itemBuilder: (context, index) {
                            final product = filteredProducts[index];
                            return CProductCardHorizontal(productModel: product);
                          },
                        ),
                      )
                      : const Text("No Products are here to show 😢"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
