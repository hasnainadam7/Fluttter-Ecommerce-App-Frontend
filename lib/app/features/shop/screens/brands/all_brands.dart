import 'package:ecommerceapp/app/features/shop/controllers/category_controller.dart';
import 'package:ecommerceapp/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appBar/app_bar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import 'brand_products.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {


    final bool dark = CHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const CAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              CSectionHeading(title: 'Brands', showActionButton: false, dark: dark),
              const SizedBox(height: CSizes.spaceBtwItems),

              /// Brands
              CGridLayout(
                itemCount: CategoryController.instance.allCategories.length,
                mainAxisExtent: 80,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return CBrandCard(
                    showBorder: true,
                    onTap:
                        () => Get.to(
                          () => BrandProducts(
                            imgPath: CategoryController.instance.allCategories[index].image,
                            title: CategoryController.instance.allCategories[index].name,
                            id: (CategoryController.instance.allCategories[index].id),
                          ),
                        ),
                    imgPath: CategoryController.instance.allCategories[index].image,
                    title: CategoryController.instance.allCategories[index].name,
                  );
                },
                dark: dark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
