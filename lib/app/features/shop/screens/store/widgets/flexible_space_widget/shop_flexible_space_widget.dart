import 'package:ecommerceapp/app/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:ecommerceapp/app/features/shop/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/cards/branded_card.dart';
import '../../../../../../common/widgets/layout/grid_layout.dart';
import '../../../../../../common/widgets/search_bar/search_bar.dart';
import '../../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/texts.dart';
import '../../../brands/all_brands.dart';
import '../../../brands/brand_products.dart';

class ShopFlexibleSpaceWidget extends StatelessWidget {
  const ShopFlexibleSpaceWidget({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CSizes.defaultSpace),

      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          CSearchBar(
            // padding: EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
            padding: EdgeInsets.zero,
            showBorder: true,
            showBackground: false,

            text: CTexts.searchBarTitleHome,
            dark: dark,
          ),

          CSectionHeading(
            textColor: CColors.dark,
            padding: EdgeInsets.zero,
            title: CTexts.featureBrands,
            showActionButton: true,
            onPressed: () {
              Get.to(() => const AllBrandsScreen());
            },
            dark: dark,
          ),

          Obx(() {
            if (CategoryController.instance.isLoading.value) {
              return const CShimmerEffect(width: 120, height: 120);
            } else {
              return CGridLayout(
                dark: dark,
                itemCount: CategoryController.instance.featuredCategories.length,
                padding: EdgeInsets.zero,
                mainAxisExtent: 80,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap:
                        () => Get.to(
                          () => BrandProducts(
                            imgPath: CategoryController.instance.featuredCategories[index].image,
                            title: CategoryController.instance.featuredCategories[index].name,
                            id: (CategoryController.instance.featuredCategories[index].id),
                          ),
                        ),
                    child: CBrandedCard(
                      showBorder: true,
                      title: CategoryController.instance.featuredCategories[index].name,
                      imgPath: CategoryController.instance.featuredCategories[index].image,
                    ),
                  );
                },
              );
            }
          }),
        ],
      ),
    );
  }
}
