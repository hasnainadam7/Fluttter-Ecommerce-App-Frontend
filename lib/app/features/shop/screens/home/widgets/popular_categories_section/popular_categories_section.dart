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
        VerticalImagesAndText(onTap: () => Get.to(() => const SubCategoriesScreen())),
      ],
    );
  }
}
