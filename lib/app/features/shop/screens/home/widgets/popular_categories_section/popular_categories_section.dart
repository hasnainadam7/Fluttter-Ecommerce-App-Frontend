import 'package:ecommerceapp/app/common/widgets/shimmer_effect/shimmer_effect.dart';
import 'package:ecommerceapp/app/features/shop/controllers/category_controller.dart';
import 'package:ecommerceapp/app/features/shop/screens/sub_category/sub_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/texts.dart';

import 'vertical_images_and_texts.dart';

class PopularCategoriesSection extends StatelessWidget {
  const PopularCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryController controller = Get.put(CategoryController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: CSizes.spaceBtwItems,
      children: [
        const CSectionHeading(
          padding: EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
          title: CTexts.popularCategories,
          showActionButton: false,
          dark: true,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: CShimmerEffect(width: double.infinity, height: 70),
              );
            }

            return SizedBox(
              height: 120,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.allCategories.length,
                itemBuilder: (_, index) {
                  return VerticalImagesAndText(
                    title: controller.allCategories[index].name,
                    images: controller.allCategories[index].image,
                    onTap:
                        () => Get.to(
                          () => SubCategoriesScreen(categoryModel: controller.allCategories[index]),
                        ),
                  );
                },
              ),
            );
          }),
        ),
      ],
    );
  }
}
